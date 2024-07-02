/*Added java function to generate randomnames*/

/*function fn() {
    var envConfig = karate.call('classpath:env.js');
    var driverConfig = envConfig.driverConfig;
    karate.configure('driver', driverConfig);
    karate.configure('baseUrl', 'https://gate1.mydigitaltimesheets.com/auth/login'); // Set your base URL here
    return driverConfig;
}*/

function generateRandomHumanName() {
    var firstNames = ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry', 'Ivy', 'Jack'];
    var surnames = ['Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Moore', 'Taylor'];

    var randomFirstName = firstNames[Math.floor(Math.random() * firstNames.length)];
    var randomSurname = surnames[Math.floor(Math.random() * surnames.length)];
    var fullName = randomFirstName + ' ' + randomSurname;

    return {
        firstName: randomFirstName,
        surname: randomSurname,
        fullName: fullName
    };
}





/*karate.configure('connectTimeout', 5000);
karate.configure('readTimeout', 5000);*/

// Exporting the functions so they can be used in feature files
/*karate.configure('karate.exports', { generateRandomHumanName: generateRandomHumanName, getEnvironments: getEnvironments });*/

