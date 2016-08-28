package _T_n
{
   import flash.display.Sprite;
   import _f7.Signal;
   import flash.display.Shape;
   import flash.display.Graphics;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.display.GraphicsPath;
   import com.company.util.GraphicHelper;
   import flash.display.IGraphicsData;
   
   public class _0fJ_ extends Sprite
   {
       
      
      public const _my:Signal = new Signal(Boolean);
      
      private const WIDTH:int = 28;
      
      private const HEIGHT:int = 28;
      
      private var _1F_a:Shape;
      
      private var selected:Shape;
      
      public function _0fJ_()
      {
         super();
         addChild(this._1F_a = this._W_2());
         addChild(this.selected = this._V_0());
         this.setSelected(false);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         this._1F_a.visible = !param1;
         this.selected.visible = param1;
         this._my.dispatch(param1);
      }
      
      private function _W_2() : Shape
      {
         var _loc1_:Shape = new Shape();
         this._1f3(_loc1_.graphics);
         return _loc1_;
      }
      
      private function _V_0() : Shape
      {
         var _loc1_:Shape = new Shape();
         this._1f3(_loc1_.graphics);
         this._zP_(_loc1_.graphics);
         return _loc1_;
      }
      
      private function _1f3(param1:Graphics) : void
      {
         var _loc2_:GraphicsSolidFill = new GraphicsSolidFill(0,0.01);
         var _loc3_:GraphicsSolidFill = new GraphicsSolidFill(16777215,1);
         var _loc4_:GraphicsStroke = new GraphicsStroke(2,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,_loc3_);
         var _loc5_:GraphicsPath = new GraphicsPath();
         GraphicHelper.drawUi(0,0,this.WIDTH,this.HEIGHT,4,GraphicHelper._nw,_loc5_);
         var _loc6_:Vector.<IGraphicsData> = new <IGraphicsData>[_loc4_,_loc2_,_loc5_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         param1.drawGraphicsData(_loc6_);
      }
      
      private function _zP_(param1:Graphics) : void
      {
         var _loc2_:GraphicsSolidFill = new GraphicsSolidFill(16777215,1);
         var _loc3_:GraphicsPath = new GraphicsPath();
         GraphicHelper.drawUi(4,4,this.WIDTH - 8,this.HEIGHT - 8,2,GraphicHelper._nw,_loc3_);
         var _loc4_:Vector.<IGraphicsData> = new <IGraphicsData>[_loc2_,_loc3_,GraphicHelper.END_FILL];
         param1.drawGraphicsData(_loc4_);
      }
   }
}
