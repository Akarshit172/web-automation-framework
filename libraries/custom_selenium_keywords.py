from selenium import webdriver
from selenium.webdriver.common.by import By
import os

# Global WebDriver instance
driver = None


# def open_browser(browser, url):
#     """
#     Opens the specified browser and navigates to the given URL.
#
#     :param browser: Browser name (chrome/firefox)
#     :param url: URL to navigate to
#     """
#     global driver
#     if browser.lower() == "chrome":
#         driver = webdriver.Chrome("drivers/chromedriver")
#     elif browser.lower() == "firefox":
#         driver = webdriver.Firefox("drivers/geckodriver")
#     else:
#         raise ValueError("Unsupported browser!")
#     driver.get(url)
#     driver.maximize_window()


def close_browser():
    """
    Closes the browser and resets the driver.
    """
    global driver
    if driver:
        driver.quit()
        driver = None


def take_screenshot(file_path):
    """
    Takes a screenshot and saves it to the specified file path.

    :param file_path: File path for the screenshot
    """
    global driver
    if not driver:
        raise ValueError("Browser is not open. Cannot take a screenshot.")
    os.makedirs(os.path.dirname(file_path), exist_ok=True)
    driver.save_screenshot(file_path)


def click_element(locator_type, locator):
    """
    Clicks on an element specified by locator.

    :param locator_type: Locator type (id, xpath, css, etc.)
    :param locator: Locator value
    """
    global driver
    locators = {
        "id": By.ID,
        "xpath": By.XPATH,
        "css": By.CSS_SELECTOR,
        "name": By.NAME,
        "class": By.CLASS_NAME,
    }
    element = driver.find_element(locators[locator_type], locator)
    element.click()


def enter_text(locator_type, locator, text):
    """
    Enters text into a field specified by locator.

    :param locator_type: Locator type (id, xpath, css, etc.)
    :param locator: Locator value
    :param text: Text to enter
    """
    global driver
    locators = {
        "id": By.ID,
        "xpath": By.XPATH,
        "css": By.CSS_SELECTOR,
        "name": By.NAME,
        "class": By.CLASS_NAME,
    }
    element = driver.find_element(locators[locator_type], locator)
    element.clear()
    element.send_keys(text)
