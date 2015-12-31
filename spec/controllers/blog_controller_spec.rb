require 'rails_helper'

RSpec.describe BlogController, type: :controller do

  describe '#INDEX' do
    it 'loads the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns an instance variable @blog' do
      blog1 = Blogpost.create!(title: 'Blog1', body: 'blog post body')
      blog2 = Blogpost.create!(title: 'Blog2', body: 'blog post body')
      get :index
      expect(assigns(:blogs)).to match_array([blog1, blog2])
    end
  end

end
