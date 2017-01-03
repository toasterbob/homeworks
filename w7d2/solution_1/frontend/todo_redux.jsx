import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';


document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// document.addEventListener('DOMContentLoaded', () => {
//   const preloadedState = localStorage.state ?
//     JSON.parse(localStorage.state) : {};
//   const store = configureStore(preloadedState);
//   // store.dispatch = addLoggingToDispatch(store);
//   //const newStore = applyMiddlewares(store, addLoggingToDispatch);
//   const root = document.getElementById('content');
//   ReactDOM.render(<Root store={store} />, root);
// });

// const addLoggingToDispatch = store => next => action => {
//   const sd = store.dispatch;
//
//   console.log(store.getState());
//   console.log(action);
//   sd(action);
//   console.log(store.getState());
//
// };
//
// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// };


// const addLoggingToDispatch = (store) =>  {
//   const sd = store.dispatch;
//   return (action) => {
//   console.log(store.getState());
//   console.log(action);
//   sd(action);
//   console.log(store.getState());
//   };
// };
