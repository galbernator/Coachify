require 'rails_helper'

RSpec.describe BlogpostsController, type: :controller do

  describe '#INDEX' do
    it 'responds with HTTP success 200' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'assigns an instance variable @blogposts' do
      blogpost1 = Blogpost.create!(title: 'Blog1', body: 'blog post body')
      blogpost2 = Blogpost.create!(title: 'Blog2', body: 'blog post body')
      get :index
      expect(assigns(:blogposts)).to match_array([blogpost1, blogpost2])
    end
  end

  describe '#NEW' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end

    it 'assigns an instance variable @blogpost' do
      get :new
      expect(assigns(:blogpost)).to be_a_new Blogpost
    end
  end

  describe '#CREATE' do

    def valid_request
      post :create, blogpost: {title: 'valid title', body: 'valid body'}
    end

    def invalid_request
      post :create, blogpost: {title: nil, body: nil}
    end

    context 'with valid attributes' do
      it 'saves a new record in the database' do
        expect do
          valid_request
        end.to change { Blogpost.count }.by 1
      end

      it 'redirects to the blog index path' do
        valid_request
        expect(response).to redirect_to blog_index_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save a new record in the database' do
        expect do
          invalid_request
        end.to_not change { Blogpost.count }
      end

      it 'renders the new template' do
        invalid_request
        expect(response).to render_template :new
      end
    end
  end

  describe '#SHOW' do

    def create_blogpost
      Blogpost.create(title: 'blogpost title', body: 'blogpost body')
    end

    def create_comment(blogpost_id)
      Comment.create(body: 'commment', blogpost_id: blogpost_id)
    end
    it 'assigns the requested blogopst to the @blogpost instance variable' do
      blogpost = create_blogpost
      get :show, id: blogpost.id
      expect(assigns(:blogpost)).to eq blogpost
    end

    it 'assigns an instance variable @comment' do
      blogpost = create_blogpost
      get :show, id: blogpost.id
      expect(assigns(:comment)).to be_a_new Comment
    end

    it 'assigns an instance variable @comments with all comments related to the blogpost' do
      blogpost1 = create_blogpost
      blogpost2 = create_blogpost
      comment1 = create_comment(blogpost1.id)
      comment2 = create_comment(blogpost2.id)
      comment3 = create_comment(blogpost1.id)
      get :show, id: blogpost1.id
      expect(assigns(:comments)).to match_array([comment1, comment3])
    end

    it 'renders the show template' do
      blogpost = create_blogpost
      get :show, id: blogpost.id
      expect(response).to render_template :show
    end
  end

  describe '#EDIT' do
    before :each do
      @blogpost = Blogpost.create(title: 'blogpost title', body: 'blogpost body')
    end

    it 'renders the edit template' do
      get :edit, id: @blogpost.id
      expect(response).to render_template :edit
    end

    it 'assigns the requested blogpost to an instance variable @blogpost' do
      get :edit, id: @blogpost.id
      expect(assigns(:blogpost)).to eq @blogpost
    end
  end

  describe '#UPDATE' do
    before :each do
      @blogpost = Blogpost.create(title: 'blogpost title', body: 'blogpost body')
    end

    def valid_request
      put :update, id: @blogpost.id, blogpost: {title: 'stuff', body: 'things'}
    end

    def invalid_request
      put :update, id: @blogpost.id, blogpost: {title: nil, body: nil}
    end

    context 'with valid attributes' do
      it 'locates the requested blogpost' do
        valid_request
        expect(assigns(:blogpost)).to eq(@blogpost)
      end

      it 'updates the attribute of the record in the database' do
        valid_request
        @blogpost.reload
        expect(@blogpost.title).to eq 'stuff'
        expect(@blogpost.body).to eq 'things'
      end

      it 'redirects to blog index path after successful update' do
        valid_request
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(blog_index_path)
      end

      it 'renders flash message' do
        valid_request
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid attributes' do
      it 'does not change attribute of record in the database' do
        invalid_request
        expect(@blogpost.title).to eq('blogpost title')
        expect(@blogpost.body).to eq('blogpost body')
      end

      it 'rerenders the edit template' do
        invalid_request
        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#DESTROY delete' do
    before :each do
      @blogpost = Blogpost.create(title: 'blogpost title', body: 'blogpost body')
    end

    it 'deletes the blogpost from the database' do
      expect do
        delete :destroy, id: @blogpost.id
      end.to change {Blogpost.count}.by -1
    end

    it 'redirects to the blog index path' do
      delete :destroy, id: @blogpost.id
      expect(response).to redirect_to(blog_index_path)
    end
  end

end
