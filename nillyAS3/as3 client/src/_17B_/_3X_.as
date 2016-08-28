package _17B_
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.ui.Button;
   import _1S_0._1mh;
   import _05g._1S_m;
   import _0xn._bf;
   import flash.events.MouseEvent;
   
   public class _3X_ extends Sprite
   {
       
      
      public var buttonOne:Button;
      
      public var buttonTwo:Button;
      
      public var _0Y_r:_1mh;
      
      public var _0X_d:_1mh;
      
      public function _3X_()
      {
         this.buttonOne = new Button(14,"buttonOne",70);
         this.buttonTwo = new Button(14,"buttonTwo",70);
         this._0Y_r = new _1mh(this.buttonOne,MouseEvent.CLICK);
         this._0X_d = new _1mh(this.buttonTwo,MouseEvent.CLICK);
         super();
         this._zD_();
         this._rq();
      }
      
      private function _rq() : void
      {
         addChild(this.buttonOne);
         addChild(this.buttonTwo);
      }
      
      private function _zD_() : void
      {
         var _loc1_:Button = null;
         var _loc2_:Array = [this.buttonOne,this.buttonTwo];
         var _loc3_:_1S_m = new _1S_m();
         for each(_loc1_ in _loc2_)
         {
            _loc3_.push(_loc1_.textChanged);
         }
         _loc3_.complete.addOnce(this._F_W_);
      }
      
      private function _F_W_() : void
      {
         this.buttonOne.x = _bf._0U_4;
         this.buttonTwo.x = _bf._0Y_O_ - this.buttonTwo.width - _bf._0U_4;
      }
   }
}
