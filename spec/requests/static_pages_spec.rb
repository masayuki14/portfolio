require 'rails_helper'

RSpec.describe "静的ページ", type: :request do
  let!(:restaurant) { create(:restaurant) }

  it "正常なレスポンスを返すこと" do
    get root_path
    expect(response).to be_success
    expect(response).to have_http_status "200"
  end
end
