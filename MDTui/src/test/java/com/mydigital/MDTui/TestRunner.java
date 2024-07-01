//package com.mydigital.MDTui;
//
//import com.intuit.karate.Results;
//import com.intuit.karate.Runner;
//import net.masterthought.cucumber.Configuration;
//import net.masterthought.cucumber.ReportBuilder;
//import org.junit.jupiter.api.Test;
//
//import java.io.File;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.List;
//
//public class TestRunner {
//
//	@Test
//	void runKarateTests() {
//		// Define the path to your feature files
//		String karateOutputPath = "target/karate-reports";
//
//		// Specify the tags you want to include or exclude
//		List<String> tags = Arrays.asList("@reg");
//
//		// List of features to run with associated tags
//		List<FeatureWithTags> featuresWithTags = List.of(
//				new FeatureWithTags("classpath:features/login.feature", tags),
//				new FeatureWithTags("classpath:features/Contractor.feature", tags),
//				new FeatureWithTags("classpath:features/Assignment.feature", tags),
//				new FeatureWithTags("classpath:features/Timesheet.feature", tags),
//				new FeatureWithTags("classpath:features/Salesinvoice.feature", tags),
//				new FeatureWithTags("classpath:features/Remittance.feature", tags)
//		// Add more features as needed
//		);
//
//		// Run Karate tests with specified tags, including UI automation features
//		for (FeatureWithTags featureWithTags : featuresWithTags) {
//			Results results = Runner.path(featureWithTags.getPath())
//					.tags(featureWithTags.getTags().toArray(new String[0])).outputCucumberJson(true).parallel(1);
//
//			// Generate Cucumber report for each feature
//			generateCucumberReport(karateOutputPath, featureWithTags.getPath());
//
//			// Fail the build if there are failed tests
//			if (results.getFailCount() > 0) {
//				throw new RuntimeException("There are failed tests in " + featureWithTags.getPath() + "!");
//			}
//		}
//	}
//
//	private void generateCucumberReport(String karateOutputPath, String featurePath) {
//		// Extract feature name for report name
//		String featureName = new File(featurePath).getName().replace(".feature", "");
//
//		// Specify the output directory and report name for Cucumber report
//		Configuration config = new Configuration(new File("target/cucumber-reports/" + featureName),
//				"Karate-UI-Report");
//
//		// Get the list of JSON files
//		List<String> jsonFiles = getJsonFiles(karateOutputPath);
//
//		// Print the list of JSON files to the console for debugging
//		System.out.println("JSON Files for " + featureName + ": " + jsonFiles);
//
//		// Create and generate the Cucumber report
//		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, config);
//		reportBuilder.generateReports();
//	}
//
//	private List<String> getJsonFiles(String karateOutputPath) {
//		// Collect JSON files manually from the specified output directory
//		List<String> jsonPaths = new ArrayList<>();
//		File outputDirectory = new File(karateOutputPath);
//
//		if (outputDirectory.exists() && outputDirectory.isDirectory()) {
//			File[] files = outputDirectory.listFiles((dir, name) -> name.endsWith(".json"));
//			if (files != null) {
//				for (File file : files) {
//					jsonPaths.add(file.getAbsolutePath());
//				}
//			}
//		}
//
//		return jsonPaths;
//	}
//
//	// Inner class to hold feature paths and their associated tags
//	private static class FeatureWithTags {
//		private final String path;
//		private final List<String> tags;
//
//		public FeatureWithTags(String path, List<String> tags) {
//			this.path = path;
//			this.tags = tags;
//		}
//
//		public String getPath() {
//			return path;
//		}
//
//		public List<String> getTags() {
//			return tags;
//		}
//	}
//}

package com.mydigital.MDTui;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.junit.jupiter.api.Test;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TestRunner {

	@Test
	void runKarateTests() {
		// Define the path to your feature files
		String karateOutputPath = "target/karate-reports";

		// Specify the tags you want to include or exclude
		List<String> tags = Arrays.asList("@reg");

		// Set the tags as a system property
		System.setProperty("karate.env.tags", String.join(",", tags));

		// Run Karate tests with specified tags, including UI automation features
		Results results = Runner.path("classpath:features").tags(tags.toArray(new String[0])).outputCucumberJson(true)
				.parallel(1);

		// Generate Cucumber report
		generateCucumberReport(karateOutputPath);

		// Fail the build if there are failed tests
		if (results.getFailCount() > 0) {
			throw new RuntimeException("There are failed tests!");
		}
	}

	private void generateCucumberReport(String karateOutputPath) {
		// Specify the output directory and report name for Cucumber report
		Configuration config = new Configuration(new File("target/cucumber-reports"), "Karate-UI-Report");

		// Get the list of JSON files
		List<String> jsonFiles = getJsonFiles(karateOutputPath);

		// Print the list of JSON files to the console for debugging
		System.out.println("JSON Files: " + jsonFiles);

		// Create and generate the Cucumber report
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, config);
		reportBuilder.generateReports();
	}

	private List<String> getJsonFiles(String karateOutputPath) {
		// Collect JSON files manually from the specified output directory
		List<String> jsonPaths = new ArrayList<>();
		File outputDirectory = new File(karateOutputPath);

		if (outputDirectory.exists() && outputDirectory.isDirectory()) {
			File[] files = outputDirectory.listFiles((dir, name) -> name.endsWith(".json"));
			if (files != null) {
				for (File file : files) {
					jsonPaths.add(file.getAbsolutePath());
				}
			}
		}

		return jsonPaths;
	}
}

//	@Test
//	void testAll() {
//		Results results = Karate.run().relativeTo(getClass()).tags("@reg").outputCucumberJson(true).parallel(1);
//		generateReport(results.getReportDir());
//		assertEquals(0, results.getFailCount(), "Expected failures");
//	}
//
//	public static void generateReport(String karateOutputPath) {
//		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
//		List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
//		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
//		Configuration config = new Configuration(new File("target"), "MDTui");
//		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
//		reportBuilder.generateReports();
//	}
//
//}
