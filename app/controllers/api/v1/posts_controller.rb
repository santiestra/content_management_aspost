module Api
  module V1
    class PostsController < ApiController
      def index
        posts = Post.where(company_id: company_id)
        render json: { posts: posts }
      end

      def show
        post = Post.find(params[:id])
        if company_id == post.company_id
          render json: { post: post }
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end

      def create
        post = Post.new(
          company_id: company_id,
          user_id: user_id,
          title: post_params[:title],
          content: post_params[:content]
        )

        post.save!
        render json: { post: post }
      rescue ActiveRecord::RecordInvalid => e
        render json: { post: { errors: post.errors } }, status: :unprocessable_entity
      end

      def update
      end

      def destroy
      end

      private

      def post_params
        params.require(:post).permit(:title, :content)
      end

      def company_id
        @user_info['company_id']
      end

      def user_id
        @user_info['user_id']
      end
    end
  end
end
