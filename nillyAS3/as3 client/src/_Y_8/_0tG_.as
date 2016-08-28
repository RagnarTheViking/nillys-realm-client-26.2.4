package _Y_8
{
   import _P_S_.Mediator;
   import _05L_._05T_;
   import _C_._Q_E_;
   import _C_._0C_J_;
   import _1I_S_._0I_V_;
   import _1I_S_._0J_a;
   import _05L_._1uF_;
   import _05L_._oa;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import PrivateMessages.SendMessageFrame;
   
   public class _0tG_ extends Mediator
   {
       
      
      [Inject]
      public var view:_Y_8._vv;
      
      [Inject]
      public var model:_05T_;
      
      [Inject]
      public var _1__p:_Q_E_;
      
      [Inject]
      public var _nJ_:_0C_J_;
      
      [Inject]
      public var _Y_Y_:_0I_V_;
      
      [Inject]
      public var _0D_X_:_0J_a;
      
      [Inject]
      public var _1rk:_1uF_;
      
      [Inject]
      public var _N___:_oa;
      
      public var stage:Stage;
      
      public function _0tG_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.stage = this.view.stage;
         this.stage.addEventListener(KeyboardEvent.KEY_UP,this._C_6);
         this.view.setup(this.model,this._1Y_2());
         this.view.message.add(this._oA_);
         this.view.close.add(this._fP_);
         this._0D_X_.add(this._0lz);
      }
      
      override public function destroy() : void
      {
         this.view.message.remove(this._oA_);
         this.view.close.remove(this._fP_);
         this._0D_X_.remove(this._0lz);
         this.stage.removeEventListener(KeyboardEvent.KEY_UP,this._C_6);
      }
      
      private function _fP_() : void
      {
         this._0D_X_.dispatch(false,"");
         this._1rk._W_M_();
      }
      
      private function _oA_(param1:String) : void
      {
         this._Y_Y_.dispatch(param1);
         this._0D_X_.dispatch(false,"");
      }
      
      private function _0lz(param1:Boolean, param2:String) : void
      {
         if(param1)
         {
            this.view.activate(param2,true);
         }
         else
         {
            this.view.deactivate();
         }
         if(!param1)
         {
            this._1rk._W_M_();
         }
      }
      
      private function _1Y_2() : TextField
      {
         var _loc1_:TextField = this._1__p._17P_();
         this._nJ_.apply(_loc1_,14,16777215,true);
         return _loc1_;
      }
      
      private function _C_6(param1:KeyboardEvent) : void
      {
         if(this.view.visible && (param1.keyCode == this._N___._15h() || (this.stage.focus == null || this._X_0())))
         {
            this._1yQ_(param1);
         }
      }
      
      private function _X_0() : Boolean
      {
         return this.stage.focus.parent != this.view && this.stage.focus != this.view;
      }
      
      private function _1yQ_(param1:KeyboardEvent) : void
      {
         if(SendMessageFrame.instance)
         {
            return;
         }
         param1.stopImmediatePropagation();
         var _loc2_:uint = param1.keyCode;
         if(_loc2_ == this._N___._W_u())
         {
            this.view.activate("/",true);
         }
         else if(_loc2_ == this._N___._0C_z())
         {
            this.view.activate(null,true);
         }
         else if(_loc2_ == this._N___._1vn())
         {
            this.view.activate("/g ",true);
         }
         else if(_loc2_ == this._N___._15h())
         {
            this._0hh();
         }
      }
      
      private function _0hh() : void
      {
         if(!this.view._1sI_())
         {
            this.view.activate("/tell " + this._1rk._0G_r() + " ",true);
         }
      }
   }
}
