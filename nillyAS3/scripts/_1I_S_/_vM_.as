package _1I_S_
{
   import _4u.Account;
   import _ge._v1;
   import _0jo._0oc;
   import _0jo._rJ_;
   import _03U_._1U_N_;
   import _05L_._1uF_;
   import _3b.DialogSignal;
   import _S_b._O_e;
   import Packets.Server.Text;
   import com.company.assembleegameclient.parameters.Parameters;
   import _05L_.ChatMessage;
   import _0J_8._0rs;
   import _bv.AnnounceDisplay;
   import _ek._18o;
   import _1xa._dU_;
   import _0hJ_._Z___;
   import _0H_6.GameContext;
   import _ge._1bc;
   import com.company.assembleegameclient.objects.GameObject;
   
   public class _vM_
   {
       
      
      private const _t9:_1I_S_._1L_Z_ = new _1I_S_._1L_Z_(14802908,16777215,5526612);
      
      private const _1rn:_1I_S_._1L_Z_ = new _1I_S_._1L_Z_(5644060,16549442,13484223);
      
      private const _3a:_1I_S_._1L_Z_ = new _1I_S_._1L_Z_(2493110,61695,13880567);
      
      private const _1cD_:_1I_S_._1L_Z_ = new _1I_S_._1L_Z_(4098560,10944349,13891532);
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var model:_v1;
      
      [Inject]
      public var _V_8:_0oc;
      
      [Inject]
      public var addSpeechBalloon:_rJ_;
      
      [Inject]
      public var _iB_:_1U_N_;
      
      [Inject]
      public var _1rk:_1uF_;
      
      [Inject]
      public var _0T_8:_1I_S_._19G_;
      
      [Inject]
      public var _0K_A_:DialogSignal;
      
      [Inject]
      public var _1tf:_O_e;
      
      public function _vM_()
      {
         super();
      }
      
      public function execute(param1:Text) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(this.model.player == null)
         {
            return;
         }
         var _loc5_:Boolean = param1.numStars_ == -1 || param1.objectId_ == -1;
         if(param1.numStars_ < Parameters.data_.chatStarRequirement && param1.name_ != this.model.player.name_ && !_loc5_ && !this._fm(param1.recipient_))
         {
            return;
         }
         if(!Parameters.data_.chatAll && param1.name_ != this.model.player.name_ && !_loc5_ && !this._fm(param1.recipient_))
         {
            if(!(param1.recipient_ == Parameters.GuildText && Parameters.data_.chatGuild))
            {
               if(!(param1.recipient_ != "" && Parameters.data_.chatWhisper))
               {
                  return;
               }
            }
         }
         if(this._1F_A_(param1))
         {
            _loc2_ = param1.cleanText_;
            param1.cleanText_ = this._0oF_(param1.cleanText_);
         }
         else
         {
            _loc2_ = param1.text_;
            param1.text_ = this._0oF_(param1.text_);
         }
         if(_loc5_ && this._1S_a(_loc2_))
         {
            _loc2_ = this._ss(_loc2_);
         }
         if(!_loc5_ && this._0T_8._ht(_loc2_))
         {
            if(param1.name_ == this.model.player.name_)
            {
               this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,"This message has been flagged as spam."));
            }
            return;
         }
         if(param1.recipient_)
         {
            if(param1.recipient_ != this.model.player.name_ && !this._fm(param1.recipient_))
            {
               this._1rk.push(param1.recipient_);
               this._1rk._W_M_();
            }
            else if(param1.recipient_ == this.model.player.name_)
            {
               this._1rk.push(param1.name_);
               this._1rk._W_M_();
            }
         }
         if(_loc5_)
         {
            if(param1.text_ == "Please verify your email before chat" && this._1tf != null && this._1tf._14O_.map.name_ == "Nexus" && this._0K_A_ != null)
            {
               this._0K_A_.dispatch(new _0rs());
            }
            else if(param1.name_ == "@ANNOUNCEMENT")
            {
               if(this._1tf != null && this._1tf._14O_ != null && this._1tf._14O_.announceDisplay != null)
               {
                  this._1tf._14O_.announceDisplay._1zm(param1.text_);
               }
               else
               {
                  AnnounceDisplay._1oW_(param1.text_);
               }
            }
            else if(param1.name_ == "#{objects.ft_shopkeep}" && !_18o._1Q_W_)
            {
               return;
            }
         }
         if(param1.objectId_ >= 0)
         {
            this._0S_Y_(param1,_loc2_);
         }
         if(_loc5_ || this.account.registered() && (!Parameters.data_["hidePlayerChat"] || this._fm(param1.name_)))
         {
            this._1Z_7(param1);
         }
      }
      
      private function _fm(param1:String) : Boolean
      {
         return param1.length > 0 && (param1.charAt(0) == "#" || param1.charAt(0) == "*");
      }
      
      public function _1Z_7(param1:Text) : void
      {
         var _loc2_:ChatMessage = new ChatMessage();
         _loc2_.name = param1.name_;
         _loc2_.objectId = param1.objectId_;
         _loc2_.numStars = param1.numStars_;
         _loc2_.admin = param1.admin_;
         _loc2_.recipientName = param1.recipient_;
         _loc2_.isTell = param1.recipient_ && !this._fm(param1.recipient_);
         _loc2_.isTell2Me = param1.recipient_ == this.model.player.name_;
         _loc2_.nameColor = param1.nameColor_;
         _loc2_.textColor = param1.textColor_;
         this._1I_Z_(param1,_loc2_);
         this._V_8.dispatch(_loc2_);
      }
      
      public function _1I_Z_(param1:Text, param2:ChatMessage) : void
      {
         var lb:_dU_ = null;
         var text:Text = param1;
         var message:ChatMessage = param2;
         try
         {
            lb = _dU_.fromJSON(text.text_);
            lb._0L_b(this._iB_);
            message.text = lb.getString();
            return;
         }
         catch(error:Error)
         {
            message.text = !!_1F_A_(text)?text.cleanText_:text.text_;
            return;
         }
      }
      
      private function _0oF_(param1:String) : String
      {
         var _loc2_:_Z___ = null;
         if(param1.substr(0,7) == "74026S9")
         {
            _loc2_ = GameContext.getInjector().getInstance(_Z___);
            if(_loc2_ && _loc2_._J_i())
            {
               return param1.replace("74026S9",_loc2_._J_i().name + ", ");
            }
         }
         return param1;
      }
      
      private function _1S_a(param1:String) : Boolean
      {
         return param1.charAt(0) == "{" && param1.charAt(param1.length - 1) == "}";
      }
      
      private function _ss(param1:String) : String
      {
         var _loc2_:_dU_ = _dU_.fromJSON(param1);
         _loc2_._0L_b(this._iB_);
         return _loc2_.getString();
      }
      
      private function _0S_Y_(param1:Text, param2:String) : void
      {
         var _loc3_:_1I_S_._1L_Z_ = null;
         var _loc4_:_1bc = null;
         var _loc5_:GameObject = this.model._0w2(param1.objectId_);
         if(_loc5_ != null)
         {
            _loc3_ = this._1B_O_(param1,_loc5_);
            _loc4_ = new _1bc(_loc5_,param2,_loc3_.back,1,_loc3_._1U_M_,1,_loc3_.text,param1.bubbleTime_,false,true);
            this.addSpeechBalloon.dispatch(_loc4_);
         }
      }
      
      private function _1B_O_(param1:Text, param2:GameObject) : _1I_S_._1L_Z_
      {
         if(param2.props_.isEnemy_)
         {
            return this._1rn;
         }
         if(param1.recipient_ == Parameters.GuildText)
         {
            return this._1cD_;
         }
         if(param1.recipient_ != "")
         {
            return this._3a;
         }
         return this._t9;
      }
      
      private function _1F_A_(param1:Text) : Boolean
      {
         return Parameters.data_.filterLanguage && param1.cleanText_.length > 0 && param1.objectId_ != this.model.player.objectId_;
      }
   }
}
