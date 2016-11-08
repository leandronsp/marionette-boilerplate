import $ from 'jquery';
import Backbone from 'backbone';
import AppLayout from 'layouts/appLayout';

describe('Rendering the main layout', function() {
  it('renders the region names', function() {
    var layout = new AppLayout();
    layout.render();

    var regions = layout.$el.find('div');
    expect($(regions[0]).attr('id')).toEqual('header-region');
    expect($(regions[1]).attr('id')).toEqual('content-region');
    expect($(regions[2]).attr('id')).toEqual('footer-region');
  });
});
