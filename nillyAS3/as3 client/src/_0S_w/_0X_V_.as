package _0S_w
{
   import ToolTips.ToolTip;
   import com.company.ui._0H_R_;
   import flash.filters.DropShadowFilter;
   
   public class _0X_V_ extends ToolTip
   {
      
      private static const _0H_p:int = 180;
       
      
      private var _7H_:_0H_R_;
      
      public function _0X_V_(param1:XML)
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
      }
   }
}
