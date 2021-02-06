require 'rails_helper'

RSpec.describe "WorkoutApp", type: :request do
  describe "トップページ" do
    it "正常なレスポンスを返すこと" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
