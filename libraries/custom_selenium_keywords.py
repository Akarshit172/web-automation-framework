from selenium.webdriver.common.by import By
from datetime import datetime
import os

def login_to_application(driver, username, password):
    """Custom Python keyword to log in to the application."""
    driver.find_element(By.ID, 'loginId').send_keys(username)
    driver.find_element(By.ID, 'password').send_keys(password)
    driver.find_element(By.ID, 'userLogin').click()

def capture_screenshot_with_path(driver, screenshot_dir):
    """Capture and save a screenshot in the specified directory with timestamp."""
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    screenshot_path = os.path.join(screenshot_dir, f"screenshot_{timestamp}.png")
    driver.save_screenshot(screenshot_path)
    print(f"Screenshot saved to {screenshot_path}")
