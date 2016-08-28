package _17B_
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import com.company.util.GraphicHelper;
   import flash.geom.ColorTransform;
   import flash.display.GraphicsPathWinding;
   
   public class _0rX_ extends Sprite
   {
       
      
      private var _17i:Vector.<IGraphicsData>;
      
      private var _1t5:GraphicsSolidFill;
      
      private var _3H_:GraphicsPath;
      
      public function _0rX_()
      {
         this._1t5 = new GraphicsSolidFill(16777215,1);
         this._3H_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>(),GraphicsPathWinding.NON_ZERO);
         this._17i = new <IGraphicsData>[this._1t5,this._3H_,GraphicHelper.END_FILL];
         super();
         this.setColor(6710886);
      }
      
      public function setColor(param1:uint) : void
      {
         graphics.clear();
         GraphicHelper.clearGraphicsPath(this._3H_);
         this._1t5.color = param1;
         this._0pU_();
         GraphicHelper.drawRect(26,11.5,24,19,this._3H_);
         graphics.drawGraphicsData(this._17i);
      }
      
      public function _0vi(param1:Boolean) : void
      {
         var _loc2_:ColorTransform = transform.colorTransform;
         _loc2_.color = !!param1?uint(16777103):uint(5526612);
         transform.colorTransform = _loc2_;
      }
      
      private function _0pU_() : void
      {
         this._3H_.moveTo(0,20);
         this._3H_.lineTo(26,0);
         this._3H_.lineTo(26,40);
         this._3H_.lineTo(0,20);
         graphics.drawGraphicsData(this._17i);
      }
   }
}
