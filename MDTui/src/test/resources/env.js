/*function fn() {
  var config = {
	Gate1: {
	  baseURL: 'https://gate1.mydigitaltimesheets.com/auth/login',
	  UserName: 'Nilan',
	  Organisation: 'TCS',
	  Password: 'Nilan@123'
	},
	Staging: {
	  baseURL: 'https://staging.mydigitaltimesheets.com/auth/login',
	  UserName: 'MDT Staging',
	  Organisation: 'Tarento',
	  Password: 'Staging@2611'
	},
	Shadowprod: {
	  baseURL: 'https://shadowprod.mydigitaltimesheets.com/auth/login',
	  UserName: 'Test Live A',
	  Organisation: 'MDT Shadow',
	  Password: 'Live@12345'
	},
	driverConfig: { type: 'chrome', start: true, stop: false, showDriverLog: true }
  };

  // Read the environment from a system property, default to 'Gate1' if not set
  var env = karate.properties['karate.env'] || 'Gate1';
  karate.log('Running in environment:', env);

  // Read the tags from a system property
  var tags = karate.properties['karate.env.tags'];
  karate.log('Running with tags:', tags);

  // Make the selected environment configuration globally available
  karate.configure('driver', config.driverConfig);
  var selectedConfig = config[env];

  return {
	selectedConfig: selectedConfig,
	tags: tags
  };
}*/



function getEnvironments() {
	var config = {
		Gate1: {
			baseURL: 'https://gate1.quartzbysapphire.com/auth/login',
			UserName: 'Nilan',
			Organisation: 'TCS',
			Password: 'Nilan@123'
			/*				  UserName: 'Testing DB',
							  Organisation: 'Quartz',
							  Password: 'MDTa@1234'*/
		},
		Staging: {
			baseURL: 'https://staging.mydigitaltimesheets.com/auth/login',
			UserName: 'MDT Staging',
			Organisation: 'Tarento',
			Password: 'Staging@2611'
		},
		Shadowprod: {
			baseURL: 'https://shadowprod.mydigitaltimesheets.com/auth/login',
			UserName: 'Test Live',
			Organisation: 'Test Live MDT',
			Password: 'Live@12345'
		},
		Live: {
			baseURL: 'https://mydigitaltimesheets.com/auth/login',
			UserName: 'Test Live',
			Organisation: 'Test Live MDT',
			Password: 'Live@12345'
		},
		Contractorlogin: {
			baseURL: 'https://gate1.quartzbysapphire.com/auth/login',
			UserName: 'Contractor A',
			Organisation: 'TCS',
			Password: 'Contractor@123'
		},
		driverConfig: { type: 'chrome', start: true, stop: false, showDriverLog: true }
	};
	return config;
}

/*function getEnvironments(env) {
	if (env === 'Gate1') {
		return {
			baseURL: 'https://gate1.mydigitaltimesheets.com/auth/login',
			UserName: 'Nilan',
			Organisation: 'TCS',
			Password: 'Nilan@123'
		};
	} else if (env === 'Staging') {
		return {
			baseURL: 'https://staging.mydigitaltimesheets.com/auth/login',
			UserName: 'MDT Staging',
			Organisation: 'Tarento',
			Password: 'Staging@2611'
		};
	} else {
		throw new Error('Invalid environment specified');
	}
}
function getBaseUrl(env) {
	return getEnvironments(env).baseURL;
}*/
