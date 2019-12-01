package com.learn.DockerDemo;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.Assert;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import io.github.bonigarcia.wdm.WebDriverManager;

public class ChromeTest {
	static protected WebDriver driver;
	@BeforeMethod
	public void setup() {
       
		  WebDriverManager.chromedriver().setup();
	    ChromeOptions chromeOptions = new ChromeOptions();

	   chromeOptions.addArguments("--headless");
	    chromeOptions.addArguments("--disable-extensions"); // disabling extensions
        chromeOptions.addArguments("--disable-gpu"); // applicable to windows os only
        chromeOptions.addArguments("--disable-dev-shm-usage"); // overcome limited resource problems
        chromeOptions.addArguments("--no-sandbox");
	    driver = new ChromeDriver(chromeOptions);
	}
	
	@Test	
	public void VerifyTitle()
	{
		driver.get("https://www.testingexcellence.com");
	    System.out.println(driver.getTitle());
	    Assert.assertEquals(driver.getTitle(), "Testing Excellence — Software Testing for Beginners and Professionals");
	}
	
	@AfterMethod
	public void teardown()
	{
		driver.close();
		driver.quit();
	}
	
}
