package _P_N_
{
   import flash.display.Sprite;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import com.company.util.GraphicHelper;
   
   public class _vd extends Sprite
   {
       
      
      private var _0O_n:GraphicsSolidFill;
      
      private var path_:GraphicsPath;
      
      public function _vd(param1:int, param2:Array)
      {
         this._0O_n = new GraphicsSolidFill(5526612);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         super();
         var _loc3_:Vector.<IGraphicsData> = new <IGraphicsData>[this._0O_n,this.path_,GraphicHelper.END_FILL];
         GraphicHelper.drawUi(0,0,param1,param1,param1 / 12,param2,this.path_);
         graphics.drawGraphicsData(_loc3_);
      }
   }
}
