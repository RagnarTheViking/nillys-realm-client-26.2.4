package _113
{
   import flash.display.Sprite;
   import _18._qP_;
   import _18._0fG_;
   import com.company.assembleegameclient.map.View;
   
   public class MapOverlay extends Sprite
   {
       
      
      private const _V_5:Object = {};
      
      private const _0s4:Object = {};
      
      public function MapOverlay()
      {
         super();
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function addSpeechBalloon(param1:_lz) : void
      {
         var _loc2_:int = param1.go_.objectId_;
         var _loc3_:_lz = this._V_5[_loc2_];
         if(_loc3_ && contains(_loc3_))
         {
            removeChild(_loc3_);
         }
         this._V_5[_loc2_] = param1;
         addChild(param1);
      }
      
      public function addStatusText(param1:_13g) : void
      {
         addChild(param1);
      }
      
      public function addQueuedText(param1:_qP_) : void
      {
         var _loc2_:_13g = new _13g(param1.go_,param1.color_,param1.lifetime_,param1.dynamic);
         _loc2_.setStringBuilder(param1._ar);
         this.addStatusText(_loc2_);
      }
      
      private function _1H_x() : _0fG_
      {
         var _loc1_:_0fG_ = new _0fG_();
         _loc1_.target = this;
         return _loc1_;
      }
      
      public function draw(param1:View, param2:int) : void
      {
         var _loc3_:_1V_O_ = null;
         var _loc4_:int = 0;
         while(_loc4_ < numChildren)
         {
            _loc3_ = getChildAt(_loc4_) as _1V_O_;
            if(!_loc3_ || _loc3_.draw(param1,param2))
            {
               _loc4_++;
            }
            else
            {
               _loc3_.dispose();
            }
         }
      }
   }
}
