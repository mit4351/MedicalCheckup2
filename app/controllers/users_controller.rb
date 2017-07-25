class UsersController < ApplicationController
    skip_before_filter :require_login, only: [:new, :create]
    before_action :signed_in_user, only: [:edit, :update]
    before_action :correct_user, only: [:edit, :update]
    
    def index
        #@users = User.all
        @users = User.page(params[:page]).per(10).order(:id)
    end
    
    def show
        @user = User.find(params[:id])
        
        respond_to do |format|
            format.html # show.html.erb
            format.pdf do
                # PDF文書を作成
                #pdf = Prawn::Document.new
                pdf  = UserPDF.new(@user)
                
                # フォントを設定(明朝体)
                pdf.font "vendor/fonts/ipaexm.ttf"
                
                # PDFに "Hello, Prawn!!" と表示する
                #pdf.text "Hello, Prawn!!"
                #pdf.text "こんにちは、プローン"
                
                # 画面にPDFを表示する
                # disposition: "inline" によりPDFはダウンロードではなく画面に表示される
                send_data pdf.render,
                filename:    "#{@user.id}.pdf",
                type:        "application/pdf",
                disposition: "inline"
            end
        end
        
    end
    
    def new
        @user = User.new
    end
    
    def edit
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            sign_in @user
            redirect_to @user
        else
            render 'new'
        end
    end
    
    def update
        if @user.update_attributes(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :enpno, :password, :password_confirmation, :authority)
    end
    
    def correct_user
        @user = User.find(params[:id])
        redirect_to root_url unless current_user?(@user)
    end
    
end
