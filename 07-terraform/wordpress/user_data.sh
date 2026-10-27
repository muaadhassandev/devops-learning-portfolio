
#!/bin/bash
set -euo pipefail

# 1. Update Ubuntu and install WordPress dependencies
export DEBIAN_FRONTEND=noninteractive

apt-get update -y

apt-get install -y \
  apache2 \
  mariadb-server \
  php \
  libapache2-mod-php \
  php-mysql \
  php-curl \
  php-gd \
  php-mbstring \
  php-xml \
  php-zip \
  curl \
  wget

# 2. Start and enable Apache and MariaDB
systemctl enable --now apache2
systemctl enable --now mariadb

# 3. Create the WordPress database and user
DB_PASSWORD=$(openssl rand -hex 24)

mysql <<SQL
CREATE DATABASE wordpress
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE USER 'wordpressuser'@'localhost'
  IDENTIFIED BY '${DB_PASSWORD}';

GRANT ALL PRIVILEGES ON wordpress.*
  TO 'wordpressuser'@'localhost';

FLUSH PRIVILEGES;
SQL

# 4. Download and configure WordPress
cd /tmp
curl -fsSL https://wordpress.org/latest.tar.gz -o wordpress.tar.gz
tar -xzf wordpress.tar.gz

# Remove the default Apache welcome page
rm -f /var/www/html/index.html

# Copy WordPress into Apache's document root
cp -a /tmp/wordpress/. /var/www/html/

# Create the WordPress configuration file
cd /var/www/html
cp wp-config-sample.php wp-config.php

# Set the database connection details
sed -i "s/database_name_here/wordpress/" wp-config.php
sed -i "s/username_here/wordpressuser/" wp-config.php
sed -i "s/password_here/${DB_PASSWORD}/" wp-config.php

# Replace the default WordPress security keys
curl -fsSL https://api.wordpress.org/secret-key/1.1/salt/ \
  -o /tmp/wp-salts.php

python3 - <<'PY'
from pathlib import Path

config = Path("/var/www/html/wp-config.php")
salts = Path("/tmp/wp-salts.php").read_text()
content = config.read_text()

start = content.index("define( 'AUTH_KEY'")
end = content.index("/* That's all, stop editing!", start)

content = content[:start] + salts + "\n" + content[end:]
config.write_text(content)
PY

# 5. Configure Apache for WordPress permalinks
cat > /etc/apache2/conf-available/wordpress.conf <<'APACHE'
<Directory /var/www/html>
    AllowOverride All
    Require all granted
</Directory>
APACHE

a2enmod rewrite
a2enconf wordpress

# Set ownership and permissions
chown -R www-data:www-data /var/www/html
find /var/www/html -type d -exec chmod 755 {} \;
find /var/www/html -type f -exec chmod 644 {} \;
chmod 640 /var/www/html/wp-config.php

# Restart Apache to apply configuration
systemctl restart apache2
