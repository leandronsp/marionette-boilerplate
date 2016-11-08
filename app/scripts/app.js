import Backbone from 'backbone';
import Marionette from 'backbone.marionette';
import AppLayout from './layouts/appLayout';
import AppRouter from './routers/appRouter';

export const App = new Marionette.Application();

App.on('before:start', () => {
  new AppRouter();
});

App.on('start', () => {
  App.layout = new AppLayout({ el: '#app' });
  App.layout.render();

  if (Backbone.history)
    Backbone.history.start();
});

App.start();
