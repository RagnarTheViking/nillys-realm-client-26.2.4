package _17B_
{
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import com.company.util.MoreColorUtil;
   import _f7.Signal;
   import _f7._0V_a;
   import _T_n._1gJ_;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.util.Currency;
   import _1xa._dU_;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import _C_._1O_I_;
   
   public class _0P_T_ extends Sprite
   {
      
      private static const _uY_:ColorMatrixFilter = new ColorMatrixFilter(MoreColorUtil._iz);
       
      
      public const _1ja:Signal = new Signal();
      
      public const _1eI_:Signal = new Signal(int);
      
      public const _03H_:Signal = new Signal(int);
      
      public const clicked:_0V_a = new Signal();
      
      private const _1fZ_:int = 7;
      
      public var _kv:_1gJ_;
      
      public var _08f:_1gJ_;
      
      private var _11P_:SimpleText;
      
      private var or:SimpleText;
      
      private var disabled:Boolean = false;
      
      public function _0P_T_()
      {
         this._kv = new _1gJ_("",14,0,Currency.GOLD);
         this._08f = new _1gJ_("",14,0,Currency.FAME);
         this._11P_ = this._1qp();
         this.or = this._1qp().setStringBuilder(new _dU_().setParams(_1O_I_._uI_));
         super();
         this._kv.addEventListener(MouseEvent.CLICK,this._0W_M_);
         this._08f.addEventListener(MouseEvent.CLICK,this._wC_);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._08f._0T_g.add(this._0O_4);
         this._kv._0T_g.add(this._0O_4);
         this._11P_.textChanged.add(this._0O_4);
      }
      
      public function _1X_u(param1:Boolean) : void
      {
         if(this.disabled != param1)
         {
            this.disabled = param1;
            this._kv.setEnabled(!this.disabled);
            this._08f.setEnabled(!this.disabled);
         }
      }
      
      public function _Y_O_() : Boolean
      {
         return this.disabled;
      }
      
      public function _1qI_(param1:int) : void
      {
         this._kv.setPrice(param1,Currency.GOLD);
         !contains(this._kv) && addChild(this._kv);
      }
      
      public function _Q_P_() : int
      {
         return this._kv._1Z_J_();
      }
      
      public function setPrefix(param1:String) : void
      {
         this._11P_.setStringBuilder(new _dU_().setParams(param1));
         !contains(this._11P_) && addChild(this._11P_);
      }
      
      public function _0M_H_() : void
      {
         contains(this._kv) && removeChild(this._kv);
         contains(this._08f) && removeChild(this._08f);
         contains(this.or) && removeChild(this.or);
      }
      
      private function _0O_4() : void
      {
         if(contains(this._kv))
         {
            this._kv.x = this._11P_.width + this._1fZ_;
         }
         if(contains(this._08f))
         {
            if(contains(this._kv))
            {
               !contains(this.or) && addChild(this.or);
               this.or.textChanged.addOnce(this._0O_4);
               this.or.x = this._kv.x + this._kv.width + this._1fZ_;
               this._08f.x = this.or.x + this.or.width + this._1fZ_;
            }
            else
            {
               this._08f.x = this._11P_.width + this._1fZ_;
            }
         }
         this._1ja.dispatch();
      }
      
      public function _N_e(param1:int) : void
      {
         this._08f.setPrice(param1,Currency.FAME);
         !contains(this._08f) && addChild(this._08f);
      }
      
      public function _rd() : int
      {
         return this._08f._1Z_J_();
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._kv.removeEventListener(MouseEvent.CLICK,this._0W_M_);
         this._08f.removeEventListener(MouseEvent.CLICK,this._wC_);
         this._08f._0T_g.remove(this._0O_4);
         this._kv._0T_g.remove(this._0O_4);
         this._11P_.textChanged.remove(this._0O_4);
      }
      
      private function _wC_(param1:MouseEvent) : void
      {
         if(!this.disabled)
         {
            this._03H_.dispatch(this._08f.price);
            this.clicked.dispatch();
         }
         this._1X_u(true);
      }
      
      private function _0W_M_(param1:MouseEvent) : void
      {
         if(!this.disabled)
         {
            this._1eI_.dispatch(this._kv.price);
            this.clicked.dispatch();
         }
         this._1X_u(true);
      }
      
      private function _1qp() : SimpleText
      {
         var _loc1_:SimpleText = new SimpleText().setSize(16).setColor(11776947).setBold(true);
         _loc1_.filters = [new DropShadowFilter(0,0,0)];
         _loc1_.y = 3;
         return _loc1_;
      }
   }
}
