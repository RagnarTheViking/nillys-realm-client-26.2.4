package _0C_j
{
   import _1gF_.SimpleText;
   import flash.filters.DropShadowFilter;
   import _f7.Signal;
   import flash.display.DisplayObject;
   import _1xa.SText;
   import _1xa._dU_;
   import _T_E_._0Z_v;
   import flash.events.MouseEvent;
   import _166.Package;
   import com.company.assembleegameclient.util.TimeConversions;
   import _C_._1O_I_;
   import flash.events.Event;
   
   public class PackageButton extends _1D_U_
   {
       
      
      private const _0zp:String = "showDuration";
      
      private const _0eg:String = "showQuantity";
      
      public var clicked:Signal;
      
      private var _state:String = "showDuration";
      
      private var _hU_:DisplayObject;
      
      var _07X_:SimpleText;
      
      var _vE_:SimpleText;
      
      var _0nf:SText;
      
      var _yP_:_dU_;
      
      public function PackageButton()
      {
         this.clicked = new Signal();
         this._07X_ = makeText();
         this._vE_ = makeText();
         this._0nf = new SText("");
         this._yP_ = new _dU_();
         super();
      }
      
      private static function makeText() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText().setSize(16).setColor(16777215);
         _loc1_.filters = [new DropShadowFilter(0,0,0)];
         return _loc1_;
      }
      
      public function init() : void
      {
         addChild(_0Z_v._1P_T_());
         addChild(this._07X_);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.setIcon(makeIcon());
      }
      
      private function setState(param1:String) : void
      {
         if(this._state == param1)
         {
            return;
         }
         if(param1 == this._0zp)
         {
            removeChild(this._vE_);
            addChild(this._07X_);
         }
         else if(param1 == this._0eg)
         {
            removeChild(this._07X_);
            addChild(this._vE_);
         }
         else
         {
            throw new Error("PackageButton.setState: Unexpected state " + param1);
         }
         this._state = param1;
      }
      
      public function _9o(param1:int) : void
      {
         if(param1 == Package.UNLIMITED)
         {
            this.setState(this._0zp);
         }
         else
         {
            this.setState(this._0eg);
         }
         this._vE_.textChanged.addOnce(this.layout);
         this._0nf.setString(param1.toString());
         this._vE_.setStringBuilder(this._0nf);
      }
      
      public function _0Y_q(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = Math.ceil(param1 / TimeConversions._S_w);
         if(_loc3_ > 1)
         {
            _loc2_ = _1O_I_._kl;
         }
         else
         {
            _loc2_ = _1O_I_._0B_b;
         }
         this._07X_.textChanged.addOnce(this.layout);
         this._yP_.setParams(_loc2_,{"number":_loc3_});
         this._07X_.setStringBuilder(this._yP_);
      }
      
      private function layout() : void
      {
         positionText(this._hU_,this._07X_);
         positionText(this._hU_,this._vE_);
      }
      
      public function setIcon(param1:DisplayObject) : void
      {
         this._hU_ = param1;
         addChild(param1);
      }
      
      public function getIcon() : DisplayObject
      {
         return this._hU_;
      }
      
      private function onMouseUp(param1:Event) : void
      {
         this.clicked.dispatch();
      }
   }
}
