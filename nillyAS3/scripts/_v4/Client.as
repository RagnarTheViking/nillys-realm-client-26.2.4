package _v4
{
   import _f7.Signal;
   import com.company.assembleegameclient.appengine.CharList;
   import _4u.Account;
   import _ge._v1;
   import _y0.Kong;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import com.company.assembleegameclient.appengine._0H_o;
   import _0hJ_._1ph;
   import flash.globalization.DateTimeFormatter;
   import flash.globalization.LocaleID;
   
   public class Client
   {
       
      
      public const creditsSig:Signal = new Signal(int);
      
      public const fameSig:Signal = new Signal(int);
      
      public const tokenSig:Signal = new Signal(int);
      
      public var charList:CharList;
      
      public var _0hW_:Boolean;
      
      private var _1ab:int;
      
      private var isAgeVerified:Boolean;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var go:_v1;
      
      public function Client()
      {
         super();
         this._0hW_ = true;
      }
      
      public function set _1U_H_(param1:int) : void
      {
         this._1ab = param1;
      }
      
      public function get _1U_H_() : int
      {
         return this._1ab;
      }
      
      public function _C_2() : Boolean
      {
         return this.charList._1O_6;
      }
      
      public function _7O_(param1:Boolean) : void
      {
         this.charList._1O_6 = param1;
      }
      
      public function ageVerified() : Boolean
      {
         return this.isAgeVerified || this.account is Kong || this.charList.isAgeVerified;
      }
      
      public function setAgeVerification(param1:Boolean) : void
      {
         this.isAgeVerified = true;
      }
      
      public function needsTutorial() : Boolean
      {
         return Parameters.data_.needsTutorial && this.charList.nextCharId_ == 1;
      }
      
      public function getMaxNumChars() : int
      {
         return this.charList.maxNumChars_;
      }
      
      public function setMaxNumChars(param1:int) : void
      {
         this.charList.maxNumChars_ = param1;
      }
      
      public function getCredits() : int
      {
         return this.charList.credits_;
      }
      
      public function getSalesForce() : String
      {
         return this.charList.salesForce_;
      }
      
      public function UpdateCredits(param1:int) : void
      {
         this.charList.credits_ = this.charList.credits_ + param1;
         this.creditsSig.dispatch(this.charList.credits_);
         if(this.go != null && this.go.player != null)
         {
            this.go.player.credits_ = this.go.player.credits_ + param1;
         }
      }
      
      public function UpdateFame(param1:int) : void
      {
         this.charList.fame_ = this.charList.fame_ + param1;
         this.fameSig.dispatch(this.charList.fame_);
         if(this.go != null && this.go.player != null)
         {
            this.go.player.currentFame_ = this.go.player.currentFame_ + param1;
         }
      }
      
      public function setCredits(param1:int) : void
      {
         if(this.charList.credits_ != param1)
         {
            this.charList.credits_ = param1;
            this.creditsSig.dispatch(param1);
            if(this.go != null && this.go.player != null)
            {
               this.go.player.credits_ = param1;
            }
         }
      }
      
      public function getFame() : int
      {
         return this.charList.fame_;
      }
      
      public function setFame(param1:int) : void
      {
         if(this.charList.fame_ != param1)
         {
            this.charList.fame_ = param1;
            this.fameSig.dispatch(param1);
            if(this.go != null && this.go.player != null)
            {
               this.go.player.currentFame_ = param1;
            }
         }
      }
      
      public function getTokens() : int
      {
         return this.charList.tokens_;
      }
      
      public function UpdateTokens(param1:int) : void
      {
         this.charList.tokens_ = this.charList.tokens_ + param1;
         this.tokenSig.dispatch(this.charList.tokens_);
         if(this.go != null && this.go.player != null)
         {
            this.go.player.tokens = this.go.player.tokens + param1;
         }
      }
      
      public function setTokens(param1:int) : void
      {
         if(this.charList.tokens_ != param1)
         {
            this.charList.tokens_ = param1;
            this.tokenSig.dispatch(param1);
            if(this.go != null && this.go.player != null)
            {
               this.go.player.tokens = param1;
            }
         }
      }
      
      public function getNumChars() : int
      {
         return this.charList.numChars_;
      }
      
      public function _0qD_(param1:int) : SavedCharacter
      {
         return this.charList._0qD_(param1);
      }
      
      public function deleteCharacter(param1:int) : void
      {
         var _loc2_:SavedCharacter = this.charList._0qD_(param1);
         var _loc3_:int = this.charList.savedChars_.indexOf(_loc2_);
         if(_loc3_ != -1)
         {
            this.charList.savedChars_.splice(_loc3_,1);
            this.charList.numChars_--;
         }
      }
      
      public function getAccountId() : String
      {
         return this.charList.accountId_;
      }
      
      public function isRegistered() : Boolean
      {
         return this.charList.accountId_ != "";
      }
      
      public function getNumStars() : int
      {
         return this.charList.numStars_;
      }
      
      public function getGuildName() : String
      {
         return this.charList.guildName_;
      }
      
      public function getGuildRank() : int
      {
         return this.charList.guildRank_;
      }
      
      public function getNextCharSlotPrice() : int
      {
         return this.charList.nextCharSlotPrice_;
      }
      
      public function getCharSlotCurrency() : int
      {
         return this.charList.charSlotCurrency;
      }
      
      public function getTotalFame() : int
      {
         return this.charList.totalFame_;
      }
      
      public function getNextCharId() : int
      {
         return this.charList.nextCharId_;
      }
      
      public function getCharacter(param1:int) : SavedCharacter
      {
         var _loc2_:SavedCharacter = null;
         for each(_loc2_ in this.charList.savedChars_)
         {
            if(_loc2_.charId() == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getCharacterByIndex(param1:int) : SavedCharacter
      {
         return this.charList.savedChars_[param1];
      }
      
      public function isAdmin() : Boolean
      {
         return this.charList.admin_;
      }
      
      public function getRank() : int
      {
         return this.charList.rank_;
      }
      
      public function _I_p() : Vector.<_0H_o>
      {
         return this.charList._xy;
      }
      
      public function _sU_() : _1ph
      {
         return this.charList._1zV_;
      }
      
      public function _07V_(param1:int, param2:String) : void
      {
         this.charList._1N___[param1] = param2;
      }
      
      public function getName() : String
      {
         return this.charList.name_;
      }
      
      public function getConverted() : Boolean
      {
         return this.charList.converted_;
      }
      
      public function setName(param1:String) : void
      {
         this.charList.name_ = param1;
      }
      
      public function _0E_I_() : Boolean
      {
         return this.charList._08q;
      }
      
      public function getNewUnlocks(param1:int, param2:int) : Array
      {
         return this.charList._dJ_(param1,param2);
      }
      
      public function hasAvailableCharSlot() : Boolean
      {
         return this.charList.hasAvailableCharSlot();
      }
      
      public function _pP_() : int
      {
         return this.charList._11l();
      }
      
      public function getSavedCharacters() : Vector.<SavedCharacter>
      {
         return this.charList.savedChars_;
      }
      
      public function getCharStats() : Object
      {
         return this.charList.charStats_;
      }
      
      public function _1bH_(param1:String, param2:String) : Boolean
      {
         var _loc3_:String = this.charList._1N___[param1];
         return _loc3_ == param2;
      }
      
      public function _1G_H_(param1:int) : Boolean
      {
         return this.charList._1pi(param1);
      }
      
      public function _13t(param1:int) : int
      {
         return this.charList._1hK_(param1);
      }
      
      public function getBestLevel(param1:int) : int
      {
         return this.charList.bestLevel(param1);
      }
      
      public function setCharList(param1:CharList) : void
      {
         this.charList = param1;
      }
      
      public function isBanned() : Boolean
      {
         return this.charList.isBanned;
      }
      
      public function getBanReasons() : String
      {
         return this.charList.banReasons;
      }
      
      public function getBanLiftTime() : String
      {
         if(this.charList.banLiftTime < 0)
         {
            return "<font color=\'#ff0000\'>Never</font>";
         }
         var _loc1_:DateTimeFormatter = new DateTimeFormatter(LocaleID.DEFAULT);
         _loc1_.setDateTimePattern("yyyy-MM-dd HH:mm:ss");
         return "<font color=\'#00ff00\'>" + _loc1_.formatUTC(new Date(this.charList.banLiftTime * 1000)) + " UTC</font>";
      }
   }
}
