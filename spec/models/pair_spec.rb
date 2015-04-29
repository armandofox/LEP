require 'spec_helper'

describe Pair do
  
  before :each do
    @user1 = User.create(id: 2)
    @user2 = User.create(id: 3)
    @user3 = User.create(id: 4)
    @pair1 = Pair.create(id: 1, member1: @user1.id.to_s, member2: @user2.id.to_s, member3: '')
  end

  describe 'check if a user is in a pair' do
    it 'should correctly return that a user is in a pair' do
      expect(@pair1.has_member?(@user2.id.to_s)).to be_true
      expect(@pair1.has_member?(@user3.id.to_s)).to be_false
    end
  end

  describe 'check how many pairs exist' do
    it 'should correctly say how many pairs there are' do
      expect(Pair.total_pairs).eql?(1)
    end
  end

  describe 'check nil or empty method' do
    it 'should correctly determine whether a string is empty or not' do
      expect(Pair.check_nil_or_empty('yolo')).to eq(false)
      expect(Pair.check_nil_or_empty('')).to eq(true)
    end
  end

  describe 'remove_user_from_pair' do
    it 'should remove a specified user from a pair' do
      expect(@pair1.member1).to eq('2')
      Pair.remove_user_from_pair(1, @user1.id)
      expect(Pair.find(1).member1).eql?('')
      Pair.add_user_to_pair(1, @user1.id)
      expect(Pair.find(1).member1).eql?('1')
      Pair.remove_user_from_pair(1, @user2.id)
      expect(Pair.find(1).member2).eql?('')
      Pair.add_user_to_pair(1, @user2.id)
      Pair.add_user_to_pair(1, @user3.id)
      Pair.remove_user_from_pair(1, @user3.id)
      expect(Pair.find(1).member3).eql?('')
    end
  end

  describe 'add_user_to_pair' do
    it 'should add a specified user to a pair' do
      Pair.add_user_to_pair(@pair1.id, @user3.id)
      expect(Pair.find(@pair1.id).member3).to eq(@user3.id.to_s)
    end
  end

  describe 'verify_pair' do
    it 'should check for valid pairs' do
    end
  end

end
