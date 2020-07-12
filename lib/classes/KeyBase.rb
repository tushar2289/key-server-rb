require_relative "Key.rb"
require_relative "../modules/Constants.rb"

class KeyBase
  include Constants

  attr_accessor :unblocked_keys
  attr_accessor :blocked_keys
  
  def initialize
    @unblocked_keys = Hash.new
    @blocked_keys = Hash.new
  end

  def generateKey
    key = Key.new
    @unblocked_keys[key.id] = key
    key
  end

  def getAvailableKey
    keys = @unblocked_keys.keys
    if keys.length > 0
      key = @unblocked_keys.delete(keys[0])
      @blocked_keys[key.id] = key
      return key
    else
      return ERROR_KEY_NOT_FOUND
    end
  end

  def unblockKey(id)
    if @blocked_keys[id] != nil
      key = @blocked_keys.delete(id)
      @unblocked_keys[key.id] = key
      return SUCCESS_KEY_UNBLOCKED
    else
      return ERROR_KEY_NOT_FOUND
    end
  end

  def deleteKey(id)
    if @blocked_keys[id] != nil
      @blocked_keys.delete(id)
      return SUCCESS_KEY_DELETED
    elsif @unblocked_keys[id] != nil
      @unblocked_keys.delete(id)
      return SUCCESS_KEY_DELETED
    else
      return ERROR_KEY_NOT_FOUND
    end
  end

  def keepAlive(id)
    if @blocked_keys[id] != nil
      @blocked_keys[id].refresh
      return SUCCESS_KEY_REFRESHED
    elsif @unblocked_keys[id] != nil
      @unblocked_keys[id].refresh
      return SUCCESS_KEY_REFRESHED
    else
      return ERROR_KEY_NOT_FOUND
    end
  end

  def unblockAllBlockedKeys
    @blocked_keys.each do |k,v|
      unblockKey(k)
    end
    puts "All blocked keys are unblocked"
  end

  DELETE_IF_REQUIRED = lambda { |k,v|
    if Time.now - v.validity_started_on > 60*5 # 5 minutes
      deleteKey(k)
    end
  }

  def deleteAllUnusedKeys
    @blocked_keys.each(&DELETE_IF_REQUIRED)
    @unblocked_keys.each(&DELETE_IF_REQUIRED)
    puts "All unused keys deleted"
  end
end