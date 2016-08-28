package _06
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import _1S_0.NativeMappedSignal;
   import flash.events.MouseEvent;
   import _1tU_._qq;
   
   public class BeginnersPackageOfferDialog extends Sprite
   {
      
      public static const _1M_a:String = "BeginnersPackageOfferDialog.dayLeft";
      
      public static const _rH_:String = "BeginnersPackageOfferDialog.daysLeft";
      
      public static var _iN_:Class = _1bI_;
       
      
      public var close:Signal;
      
      public var buy:Signal;
      
      private var _0yu:SimpleText;
      
      public function BeginnersPackageOfferDialog()
      {
         super();
         this._1L_c();
         this._aB_();
         this._C_r();
         this._6d();
      }
      
      public function _062(param1:int) : void
      {
         var _loc2_:String = param1 > 1?_rH_:_1M_a;
         this._0yu.setStringBuilder(new _dU_().setParams(_loc2_,{"days":param1}));
      }
      
      public function _17D_() : void
      {
         stage;
         x = (800 - width) * 0.5;
         stage;
         y = (600 - height) * 0.5;
      }
      
      private function _1L_c() : void
      {
         addChild(new _iN_());
      }
      
      private function _aB_() : void
      {
         this._0yu = new SimpleText().setSize(14).setColor(14928128);
         this._0yu.setBold(true);
         this._0yu.x = 307;
         this._0yu.y = 380;
         addChild(this._0yu);
      }
      
      private function _6d() : void
      {
         var _loc1_:Sprite = this._qD_(270,400,150,40);
         this.buy = new NativeMappedSignal(_loc1_,MouseEvent.CLICK);
      }
      
      private function _C_r() : void
      {
         var _loc1_:Sprite = this._qD_(550,30,30,30);
         this.close = new NativeMappedSignal(_loc1_,MouseEvent.CLICK);
      }
      
      private function _qD_(param1:int, param2:int, param3:int, param4:int) : Sprite
      {
         var _loc5_:_qq = new _qq(param1,param2,param3,param4);
         addChild(_loc5_);
         return _loc5_;
      }
   }
}
