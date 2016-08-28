package _0J_8
{
   import Frames.Frame;
   import _f7.Signal;
   import Frames.TextInput;
   import _4u.Account;
   import _17B_.XImageButton;
   import flash.events.MouseEvent;
   import _C_._1O_I_;
   import com.company.util._0vj;
   import _aW_.IWebRequest;
   import _0H_6.GameContext;
   import com.company.util._l5;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   import _0O_c._H_0;
   
   public class _0rs extends Frame
   {
       
      
      public var register:Signal;
      
      public var cancel:Signal;
      
      private var _xk:TextInput;
      
      private var account:Account;
      
      private var _1D_r:XImageButton;
      
      private var _1jW_:Boolean = false;
      
      public function _0rs()
      {
         this.register = new Signal(_H_0);
         super(_1O_I_._0rP_,_1O_I_._19b,_1O_I_._4f);
         this._C_h();
         removeChild(cancelButton);
         this.account = GameContext.getInjector().getInstance(Account);
         this._0oE_();
         this._0la();
         this.addEventListeners();
      }
      
      private function addEventListeners() : void
      {
         actionButton.addEventListener(MouseEvent.CLICK,this._13p);
         this._1D_r.addEventListener(MouseEvent.CLICK,this.onCancel);
      }
      
      private function _0oE_() : void
      {
         this._xk = new TextInput(_1O_I_._en,false);
         if(_0vj._1mE_(this.account.getUserId()))
         {
            this._xk.inputText_.setText(this.account.getUserId());
         }
         else
         {
            this._xk.inputText_.setText("");
            this._1jW_ = true;
         }
         _O_n(this._xk);
         this._1D_r = new XImageButton();
         this._1D_r.y = -2;
         this._1D_r.x = w_ - this._1D_r.width - 8;
         addChild(this._1D_r);
      }
      
      private function _0la() : void
      {
         this._xk.tabIndex = 1;
         actionButton.tabIndex = 2;
         this._xk.tabEnabled = true;
         actionButton.tabEnabled = true;
      }
      
      private function onCancel(param1:MouseEvent) : void
      {
         this.close();
      }
      
      private function close() : void
      {
         if(parent && parent.contains(this))
         {
            parent.removeChild(this);
         }
      }
      
      private function _13p(param1:MouseEvent) : void
      {
         var _loc2_:IWebRequest = null;
         var _loc3_:Object = null;
         if(this._7A_())
         {
            _loc2_ = GameContext.getInjector().getInstance(IWebRequest);
            _loc2_.complete.addOnce(this.onComplete);
            _loc3_ = {"newGuid":this._xk.text()};
            _l5._0an(_loc3_,this.account.credentials());
            _loc2_.sendRequest("account/changeEmail",_loc3_);
            actionButton.removeEventListener(MouseEvent.CLICK,this._13p);
         }
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._uR_();
         }
         else
         {
            this._B_H_(param2);
         }
         actionButton.addEventListener(MouseEvent.CLICK,this._13p);
      }
      
      private function _uR_() : void
      {
         var _loc1_:Account = GameContext.getInjector().getInstance(Account);
         if(!this._1jW_)
         {
            _loc1_._0cX_(this._xk.text(),_loc1_._0a7());
         }
         removeChild(_7H_);
         _7H_ = new SimpleText().setSize(12).setColor(11776947);
         _7H_.setStringBuilder(new _dU_().setParams("WebAccountDetailDialog.sent"));
         _7H_.filters = [new DropShadowFilter(0,0,0)];
         _7H_.x = 5;
         _7H_.y = 3;
         _7H_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         addChild(_7H_);
      }
      
      private function _B_H_(param1:String) : void
      {
         removeChild(_7H_);
         _7H_ = new SimpleText().setSize(12).setColor(16549442);
         _7H_.setStringBuilder(new _dU_().setParams(param1));
         _7H_.filters = [new DropShadowFilter(0,0,0)];
         _7H_.x = 5;
         _7H_.y = 3;
         _7H_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         addChild(_7H_);
      }
      
      private function _7A_() : Boolean
      {
         var _loc1_:Boolean = _0vj._1mE_(this._xk.text());
         if(!_loc1_)
         {
            this._xk.setErrorText(_1O_I_._pR_);
         }
         return _loc1_;
      }
      
      private function _C_h() : void
      {
         WebMain.stage_;
         this.x = 800 / 2 - this.w_ / 2;
         WebMain.stage_;
         this.y = 600 / 2 - this.h_ / 2;
      }
   }
}
