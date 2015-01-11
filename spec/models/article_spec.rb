require 'rails_helper'

RSpec.describe Article, :type => :model do
  describe '#valid?' do
    subject(:article) { build(:article) }

    context 'titleが空のとき' do
      before do
        article.title = ''
      end

      specify { expect(subject).not_to be_valid }
    end
  end
end
