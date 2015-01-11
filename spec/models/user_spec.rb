require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '#valid?' do
    subject(:user) { build(:user) }
    
    context 'providerが空のとき' do
      before do
        user.provider = ''
      end

      specify { expect(subject).not_to be_valid }
    end

    context 'uidが空のとき' do
      before do
        user.uid = ''
      end

      specify { expect(subject).not_to be_valid }
    end

    context 'uidが重複するとき' do
      before do
        create(:user, uid: user.uid)
      end
      
      specify { expect(subject).not_to be_valid }
    end
    
    context 'screen_nameが空のとき' do
      before do
        user.screen_name = ''
      end

      specify { expect(subject).not_to be_valid }
    end

    context 'nameが空のとき' do
      before do
        user.name = ''
      end

      specify { expect(subject).not_to be_valid }
    end
  end

  describe '#destroy' do
    let!(:user) { create(:user) }
    let!(:article) { create(:article, user: user) }

    context 'userをdestoryしたとき' do
      it 'userの持つarticleが全て削除される' do
        expect { user.destroy }.to change(Article, :count).by(-1)
      end
    end
  end
end
