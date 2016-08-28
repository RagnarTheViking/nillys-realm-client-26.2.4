package _0S_w
{
   import ToolTips.ToolTip;
   import com.company.ui._0H_R_;
   import flash.filters.DropShadowFilter;
   
   public class _B_d extends ToolTip
   {
      
      private static const _0H_p:int = 180;
       
      
      private var _7H_:_0H_R_;
      
      private var _1s5:_0H_R_;
      
      public function _B_d(param1:XML)
      {
         super(3552822,1,10197915,1,true);
         this._7H_ = new _0H_R_(16,16777215,false,_0H_p - 4,0);
         this._7H_.setBold(true);
         this._7H_.wordWrap = true;
         this._7H_.text = String(param1.@id);
         this._7H_._13s();
         this._7H_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         this._7H_.x = 0;
         this._7H_.y = 0;
         addChild(this._7H_);
         var _loc2_:* = "";
         if(param1.hasOwnProperty("Speed"))
         {
            _loc2_ = _loc2_ + ("Speed: " + Number(param1.Speed).toFixed(2) + "\n");
         }
         else
         {
            _loc2_ = _loc2_ + "Speed: 1.00\n";
         }
         if(param1.hasOwnProperty("NoWalk"))
         {
            _loc2_ = _loc2_ + "Unwalkable\n";
         }
         if(param1.hasOwnProperty("Push"))
         {
            _loc2_ = _loc2_ + "Push\n";
         }
         if(param1.hasOwnProperty("Sink"))
         {
            _loc2_ = _loc2_ + "Sink\n";
         }
         if(param1.hasOwnProperty("Sinking"))
         {
            _loc2_ = _loc2_ + "Sinking\n";
         }
         if(param1.hasOwnProperty("Animate"))
         {
            _loc2_ = _loc2_ + "Animated\n";
         }
         if(param1.hasOwnProperty("RandomOffset"))
         {
            _loc2_ = _loc2_ + "Randomized\n";
         }
         this._1s5 = new _0H_R_(14,11776947,false,_0H_p,0);
         this._1s5.wordWrap = true;
         this._1s5.text = String(_loc2_);
         this._1s5._13s();
         this._1s5.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         this._1s5.x = 0;
         this._1s5.y = this._7H_.height + 2;
         addChild(this._1s5);
      }
   }
}
