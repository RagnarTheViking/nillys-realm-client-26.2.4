package _Y_8
{
   import _P_S_.Mediator;
   import _05L_._05T_;
   import _4u.Account;
   import _05L_._oa;
   import _1I_S_._0J_a;
   import _1I_S_._1d5;
   import _05L_._1uF_;
   import _S_b._O_e;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _m2._0U_b;
   import flash.display.Stage;
   import flash.display.Sprite;
   import _0O_c._H_0;
   import flash.events.KeyboardEvent;
   import flash.events.Event;
   import PrivateMessages.SendMessageFrame;
   import _0J_8.NeedRegistrationDialog;
   import _C_._1O_I_;
   
   public class _1R_W_ extends Mediator
   {
      
      private static const _1X_D_:int = 10;
       
      
      [Inject]
      public var view:_Y_8.Chat;
      
      [Inject]
      public var model:_05T_;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _0in:_oa;
      
      [Inject]
      public var _0D_X_:_0J_a;
      
      [Inject]
      public var _0P_X_:_1d5;
      
      [Inject]
      public var _1rk:_1uF_;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var register:_0U_b;
      
      private var stage:Stage;
      
      private var _17l:int;
      
      private var _0aD_:int;
      
      private var _1aa:Boolean = false;
      
      public function _1R_W_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.x = this.model.chat.left;
         this.view.y = this.model.chat.top;
         this.view.setup(this.model,this.account.registered());
         this.stage = this.view.stage;
         this._1a3();
         this._0D_X_.add(this._0lz);
         this._06Z_.add(this._tR_);
         this._0dR_.add(this._A_1);
         this.register.add(this._02T_);
      }
      
      private function _tR_(param1:Sprite) : void
      {
         this._1Y_u();
      }
      
      private function _A_1() : void
      {
         this._1a3();
      }
      
      private function _0lz(param1:Boolean, param2:String) : void
      {
         if(param1)
         {
            this.stage.focus = this.view;
            this._1aa = false;
         }
         else
         {
            this._1a3();
            this.stage.focus = null;
         }
      }
      
      private function _02T_(param1:_H_0) : void
      {
         if(param1.error == null)
         {
            this.view._Q_D_();
         }
      }
      
      override public function destroy() : void
      {
         this._1Y_u();
         this._0D_X_.remove(this._0lz);
         this._06Z_.remove(this._tR_);
         this._0dR_.remove(this._A_1);
         this.stage = null;
      }
      
      private function _1a3() : void
      {
         if(!this._1aa)
         {
            this.stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
            this.stage.addEventListener(KeyboardEvent.KEY_UP,this._C_6);
            this._1aa = true;
         }
      }
      
      private function _1Y_u() : void
      {
         if(this._1aa)
         {
            this.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
            this.stage.removeEventListener(KeyboardEvent.KEY_UP,this._C_6);
            this.stage.removeEventListener(Event.ENTER_FRAME,this._0W_6);
            this._1aa = false;
         }
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == this._0in._bM_())
         {
            this._1hA_(-1);
         }
         else if(param1.keyCode == this._0in._0n9())
         {
            this._1hA_(1);
         }
      }
      
      private function _1hA_(param1:int) : void
      {
         this._17l = param1;
         this._0P_X_.dispatch(param1);
         this._0aD_ = 0;
         this.view.addEventListener(Event.ENTER_FRAME,this._0W_6);
      }
      
      private function _0W_6(param1:Event) : void
      {
         if(this._0aD_++ >= _1X_D_)
         {
            this._0P_X_.dispatch(this._17l);
         }
      }
      
      private function _C_6(param1:KeyboardEvent) : void
      {
         if(this._1aa)
         {
            this._0iB_(param1.keyCode);
         }
         if(param1.keyCode == this._0in._bM_() || param1.keyCode == this._0in._0n9())
         {
            this.view.removeEventListener(Event.ENTER_FRAME,this._0W_6);
         }
      }
      
      private function _0iB_(param1:uint) : void
      {
         if(SendMessageFrame.instance)
         {
            return;
         }
         if(this.stage.focus == null || param1 == this._0in._15h())
         {
            if(param1 == this._0in._W_u())
            {
               this._0wE_("/");
            }
            else if(param1 == this._0in._0C_z())
            {
               this._0wE_("");
            }
            else if(param1 == this._0in._1vn())
            {
               this._0wE_("/g ");
            }
            else if(param1 == this._0in._15h())
            {
               this._0wE_("/tell " + this._1rk._0G_r() + " ");
            }
         }
      }
      
      private function _0wE_(param1:String) : void
      {
         if(this.account.registered())
         {
            this._0D_X_.dispatch(true,param1);
         }
         else if(this._1tf._14O_ != null && this._1tf._14O_.evalIsNotInCombatMapArea())
         {
            this._06Z_.dispatch(new NeedRegistrationDialog(_1O_I_._F_N_));
         }
      }
   }
}
