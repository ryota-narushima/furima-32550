require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、last_name_j、first_name_j、last_name_k、first_name_k、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合で６文字以上なら登録できる' do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end
      it 'last_name_jが全角（漢字・ひらがな・カタカナ）なら登録できる' do
        @user.last_name_j = "あア阿"
        expect(@user).to be_valid
      end
      it 'first_name_jが全角（漢字・ひらがな・カタカナ）なら登録できる' do
        @user.first_name_j = "あア阿"
        expect(@user).to be_valid
      end
      it 'last_name_kが全角（カタカナ）なら登録できる' do
        @user.last_name_k = "アアア"
        expect(@user).to be_valid
      end
      it 'first_name_kが全角（カタカナ）なら登録できる' do
        @user.first_name_k = "アアア"
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれてなければ登録できない' do
        @user.email = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordに全角文字が含まれていると登録できない' do
        @user.password = "あア阿ああああ"
        @user.password_confirmation = "あア阿ああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが半角数字だけでは登録できない' do
        @user.password = "1234567"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが半角英字だけでは登録できない' do
        @user.password = "abcdefg"
        @user.password_confirmation = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'last_name_jが空では登録できない' do
        @user.last_name_j = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name j can't be blank")
      end
      it 'last_name_jが半角文字では登録できない' do
        @user.last_name_j = "aAｱ1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name j is invalid")
      end
      it 'last_name_jが全角文字でも英字では登録できない' do
        @user.last_name_j = "ＡＢＣＤ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name j is invalid")
      end
      it 'first_name_jが空では登録できない' do
        @user.first_name_j = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name j can't be blank")
      end
      it 'first_name_jが半角文字では登録できない' do
        @user.first_name_j = "aAｱ1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name j is invalid")
      end
      it 'first_name_jが全角文字でも英字では登録できない' do
        @user.first_name_j = "ＡＢＣＤ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name j is invalid")
      end
      it 'last_name_kが空では登録できない' do
        @user.last_name_k = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name k can't be blank")
      end
      it 'last_name_kが半角文字では登録できない' do
        @user.last_name_k = "aAｱ1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name k is invalid")
      end
      it 'last_name_kが全角文字でも英字では登録できない' do
        @user.last_name_k = "ＡＢＣＤ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name k is invalid")
      end
      it 'first_name_kが空では登録できない' do
        @user.first_name_k = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k can't be blank")
      end
      it 'first_name_kが半角文字では登録できない' do
        @user.first_name_k = "aAｱ1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k is invalid")
      end
      it 'first_name_kが全角文字でも英字では登録できない' do
        @user.first_name_k = "ＡＢＣＤ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k is invalid")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
