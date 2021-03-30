# 

This website is used for management activity info for the shareapy admin.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Please get into below link for checking the prerequisites of angular

```
 https://angular.io/guide/setup-local
```

### Installing

To install the web into the local environment, please follow those below steps and run them on your terminal/window console.

Install the node_modules dependencies

```
npm run install
```

Run the angular serve command

```
ng serve
```

If your terminal/window console show the text below, it means that you have successfully built the website locally.

```
Compiled successfully.
```

If you want to change the firebase database to your own, please change the firebase config of the file src/environments/environment.ts

## Deployment

To self-hosting into your own firebase, please read and follow the instructions of Firebase hosting

```
  https://firebase.google.com/docs/hosting
```

To build the production version for deploying, please run this command in terminal/window console:

```
  ng build --prod
```

To deploy bundle into firebase, if you have configured, run this command:

```
  firebase deploy
```

## Built With

- [Angular](https://angular.io/) - The web framework used.
- [NPM](https://www.npmjs.com/) - Dependency Management.
- [Node.js](https://nodejs.org/) - The web framework.
- [Angular Material](https://material.angular.io/) - The base UI components.

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

- **Shareapy Team** - [BarleyVN](mailto:barleyvietnam@gmail.com)

## Acknowledgments

- This project is used for helping admins of the Shareapy project.
- For more information about the Shareapy project, please contact with us by the email above.
