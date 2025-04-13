import pytest
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

@pytest.fixture(scope="module")
def driver():
    chrome_options = Options()
    # Aseta headless-tila
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--disable-gpu")
    # Määrittele käyttäjätietohakemisto, jonka avulla selain käyttää erillistä profiilia.
    chrome_options.add_argument("--user-data-dir=/tmp/robot_temp")
    
    driver = webdriver.Chrome(options=chrome_options)
    yield driver
    driver.quit()

def test_wikipedia_title(driver):
    driver.get("https://www.wikipedia.org/")
    assert "Wikipedia" in driver.title, "Wikipedia-sivun otsikon pitää sisältää sanan 'Wikipedia'"