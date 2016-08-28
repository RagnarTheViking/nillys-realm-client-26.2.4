package com.company.assembleegameclient.appengine
{
   import flash.events.Event;
   import _0hJ_._1ph;
   import _4u.Account;
   import com.company.assembleegameclient.objects.Player;
   import _Z_U_._117;
   import _0H_6.GameContext;
   import _wi.Injector;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class CharList extends Event
   {
      
      public static const SAVED_CHARS_LIST:String = "SAVED_CHARS_LIST";
      
      public static const _O_Y_:String = "available";
      
      public static const _1wn:String = "unavailable";
      
      public static const _1lc:String = "unrestricted";
      
      private static const _wp:_1ph = new _1ph(37.4436,-122.412);
      
      private static const _0lU_:String = "unavailable";
       
      
      private var _0J_r:String;
      
      private var _0jG_:XML;
      
      public var accountId_:String;
      
      public var nextCharId_:int;
      
      public var maxNumChars_:int;
      
      public var numChars_:int = 0;
      
      public var savedChars_:Vector.<com.company.assembleegameclient.appengine.SavedCharacter>;
      
      public var charStats_:Object;
      
      public var totalFame_:int = 0;
      
      public var fame_:int = 0;
      
      public var credits_:int = 0;
      
      public var tokens_:int = 0;
      
      public var numStars_:int = 0;
      
      public var nextCharSlotPrice_:int;
      
      public var charSlotCurrency:int;
      
      public var guildName_:String;
      
      public var guildRank_:int;
      
      public var name_:String = null;
      
      public var _08q:Boolean;
      
      public var converted_:Boolean;
      
      public var admin_:Boolean;
      
      public var _xy:Vector.<com.company.assembleegameclient.appengine._0H_o>;
      
      public var _1zV_:_1ph;
      
      public var salesForce_:String = "unavailable";
      
      public var _1O_6:Boolean = false;
      
      public var _1N___:Object;
      
      public var isAgeVerified:Boolean;
      
      public var isBanned:Boolean;
      
      public var banReasons:String;
      
      public var banLiftTime:int;
      
      public var rank_:int;
      
      private var account:Account;
      
      public function CharList(param1:String)
      {
         var _loc2_:* = undefined;
         var _loc3_:Account = null;
         this.savedChars_ = new Vector.<com.company.assembleegameclient.appengine.SavedCharacter>();
         this.charStats_ = {};
         this._xy = new Vector.<com.company.assembleegameclient.appengine._0H_o>();
         super(SAVED_CHARS_LIST);
         this._0J_r = param1;
         this._0jG_ = new XML(this._0J_r);
         var _loc4_:XML = XML(this._0jG_.Account);
         this.parseAccountInfo(_loc4_);
         this._0E_R_(_loc4_);
         this._0mM_(_loc4_);
         this.parseBanned(_loc4_);
         this._1Q_8();
         this._2__2();
         this._28();
         this._0oz();
         this._0D_C_();
         this._1ts();
         var _loc5_:Injector = GameContext.getInjector();
         if(_loc5_)
         {
            _loc3_ = _loc5_.getInstance(Account);
            _loc3_._rO_("BestLevel",this._0cG_());
            _loc3_._rO_("BestFame",this._0J_U_());
            _loc3_._rO_("NumStars",this.numStars_);
         }
         this._1N___ = new Object();
         for each(_loc2_ in this._0jG_.ClassAvailabilityList.ClassAvailability)
         {
            this._1N___[_loc2_.@id.toString()] = _loc2_.toString();
         }
      }
      
      public function _0qD_(param1:int) : com.company.assembleegameclient.appengine.SavedCharacter
      {
         var _loc2_:com.company.assembleegameclient.appengine.SavedCharacter = null;
         for each(_loc2_ in this.savedChars_)
         {
            if(_loc2_.charId() == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function parseAccountInfo(param1:XML) : void
      {
         this.accountId_ = param1.AccountId;
         this.name_ = param1.Name;
         this._08q = param1.hasOwnProperty("NameChosen");
         this.converted_ = param1.hasOwnProperty("Converted");
         this.admin_ = param1.hasOwnProperty("Admin");
         this.rank_ = int(param1.Rank);
         Player.isAdmin = this.admin_;
         Player.rank = this.rank_;
         this.totalFame_ = int(param1.Stats.TotalFame);
         this.fame_ = int(param1.Stats.Fame);
         this.credits_ = int(param1.Credits);
         this.tokens_ = int(param1.FortuneToken);
         this.nextCharSlotPrice_ = int(param1.NextCharSlotPrice);
         this.charSlotCurrency = int(param1.CharSlotCurrency);
         this.isAgeVerified = this.accountId_ != "" && param1.IsAgeVerified == 1;
         this._1O_6 = true;
      }
      
      private function _0E_R_(param1:XML) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:_117 = null;
         if(param1.hasOwnProperty("BeginnerPackageTimeLeft"))
         {
            _loc2_ = param1.BeginnerPackageTimeLeft;
            _loc3_ = this._dr();
            _loc3_._1hN_(_loc2_);
         }
      }
      
      private function _dr() : _117
      {
         var _loc1_:Injector = GameContext.getInjector();
         return _loc1_.getInstance(_117);
      }
      
      private function _0mM_(param1:XML) : void
      {
         var _loc2_:XML = null;
         if(param1.hasOwnProperty("Guild"))
         {
            _loc2_ = XML(param1.Guild);
            this.guildName_ = _loc2_.Name;
            this.guildRank_ = int(_loc2_.Rank);
         }
      }
      
      private function parseBanned(param1:XML) : void
      {
         this.isBanned = param1.hasOwnProperty("Banned");
         this.banReasons = param1.Banned;
         this.banLiftTime = param1.Banned.@liftTime;
      }
      
      private function _1Q_8() : void
      {
         var _loc1_:XML = null;
         this.nextCharId_ = int(this._0jG_.@nextCharId);
         this.maxNumChars_ = int(this._0jG_.@maxNumChars);
         for each(_loc1_ in this._0jG_.Char)
         {
            this.savedChars_.push(new com.company.assembleegameclient.appengine.SavedCharacter(_loc1_,this.name_));
            this.numChars_++;
         }
         this.savedChars_.sort(com.company.assembleegameclient.appengine.SavedCharacter._zg);
      }
      
      private function _2__2() : void
      {
         var _loc1_:XML = null;
         var _loc2_:int = 0;
         var _loc3_:_0Z_6 = null;
         var _loc4_:XML = XML(this._0jG_.Account.Stats);
         for each(_loc1_ in _loc4_.ClassStats)
         {
            _loc2_ = int(_loc1_.@objectType);
            _loc3_ = new _0Z_6(_loc1_);
            this.numStars_ = this.numStars_ + _loc3_.numStars();
            this.charStats_[_loc2_] = _loc3_;
         }
      }
      
      private function _28() : void
      {
         var _loc1_:XML = null;
         var _loc2_:XML = XML(this._0jG_.News);
         for each(_loc1_ in _loc2_.Item)
         {
            this._xy.push(new com.company.assembleegameclient.appengine._0H_o(_loc1_.Icon,_loc1_.Title,_loc1_.TagLine,_loc1_.Link,int(_loc1_.Date)));
         }
      }
      
      private function _0oz() : void
      {
         if(this._0jG_.hasOwnProperty("Lat") && this._0jG_.hasOwnProperty("Long"))
         {
            this._1zV_ = new _1ph(Number(this._0jG_.Lat),Number(this._0jG_.Long));
         }
         else
         {
            this._1zV_ = _wp;
         }
      }
      
      private function _0D_C_() : void
      {
         if(this._0jG_.hasOwnProperty("SalesForce") && this._0jG_.hasOwnProperty("SalesForce"))
         {
            this.salesForce_ = String(this._0jG_.SalesForce);
         }
      }
      
      public function bestLevel(param1:int) : int
      {
         var _loc2_:_0Z_6 = this.charStats_[param1];
         return _loc2_ == null?0:int(_loc2_.bestLevel());
      }
      
      public function _0cG_() : int
      {
         var _loc1_:_0Z_6 = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.charStats_)
         {
            if(_loc1_.bestLevel() > _loc2_)
            {
               _loc2_ = _loc1_.bestLevel();
            }
         }
         return _loc2_;
      }
      
      public function _1hK_(param1:int) : int
      {
         var _loc2_:_0Z_6 = this.charStats_[param1];
         return _loc2_ == null?0:int(_loc2_._1hK_());
      }
      
      public function _0J_U_() : int
      {
         var _loc1_:_0Z_6 = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.charStats_)
         {
            if(_loc1_._1hK_() > _loc2_)
            {
               _loc2_ = _loc1_._1hK_();
            }
         }
         return _loc2_;
      }
      
      public function _1pi(param1:int) : Boolean
      {
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:XML = ObjectLibrary.XmlData[param1];
         for each(_loc2_ in _loc4_.UnlockLevel)
         {
            _loc3_ = ObjectLibrary._07h[_loc2_.toString()];
            if(this.bestLevel(_loc3_) < int(_loc2_.@level))
            {
               return false;
            }
         }
         return true;
      }
      
      public function _11l() : int
      {
         return this.maxNumChars_ - this.numChars_;
      }
      
      public function hasAvailableCharSlot() : Boolean
      {
         return this.numChars_ < this.maxNumChars_;
      }
      
      public function _dJ_(param1:int, param2:int) : Array
      {
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:XML = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:int = 0;
         var _loc10_:Array = new Array();
         while(_loc11_ < ObjectLibrary._1bS_.length)
         {
            _loc3_ = ObjectLibrary._1bS_[_loc11_];
            _loc4_ = int(_loc3_.@type);
            if(!this._1pi(_loc4_))
            {
               _loc5_ = true;
               _loc6_ = false;
               for each(_loc7_ in _loc3_.UnlockLevel)
               {
                  _loc8_ = ObjectLibrary._07h[_loc7_.toString()];
                  _loc9_ = int(_loc7_.@level);
                  if(this.bestLevel(_loc8_) < _loc9_)
                  {
                     if(_loc8_ != param1 || _loc9_ != param2)
                     {
                        _loc5_ = false;
                        break;
                     }
                     _loc6_ = true;
                  }
               }
               if(_loc5_ && _loc6_)
               {
                  _loc10_.push(_loc4_);
               }
            }
            _loc11_++;
         }
         return _loc10_;
      }
      
      override public function clone() : Event
      {
         return new CharList(this._0J_r);
      }
      
      override public function toString() : String
      {
         return "[" + " numChars: " + this.numChars_ + " maxNumChars: " + this.maxNumChars_ + " ]";
      }
      
      private function _1ts() : void
      {
         var _loc1_:Injector = GameContext.getInjector();
         if(_loc1_)
         {
            this.account = _loc1_.getInstance(Account);
            this.account && this._050();
         }
      }
      
      private function _050() : void
      {
         var _loc1_:XML = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < ObjectLibrary._1bS_.length)
         {
            _loc1_ = ObjectLibrary._1bS_[_loc4_];
            _loc2_ = int(_loc1_.@type);
            if(this._1pi(_loc2_))
            {
               this.account._rO_(_loc1_.@id + "Unlocked",1);
               _loc3_++;
            }
            _loc4_++;
         }
         this.account._rO_("ClassesUnlocked",_loc3_);
      }
   }
}
