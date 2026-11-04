from app.app import greet

def test_greet():
    assert greet("Muaad") == "Hello, Muaad!"

def test_greet_with_different_name():
    assert greet("Alex") == "Hello, Alex!"