package _1H_T_
{
   import flash.display.Sprite;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import flash.display.Shape;
   import _1O_n._zL_;
   import com.company.util.GraphicHelper;
   import com.company.assembleegameclient.objects.Player;
   import _1pm._0P_M_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class _0U_J_ extends Sprite
   {
      
      public static const TILE_DOUBLE_CLICK:String = "TILE_DOUBLE_CLICK";
      
      public static const TILE_SINGLE_CLICK:String = "TILE_SINGLE_CLICK";
      
      public static const WIDTH:int = 40;
      
      public static const HEIGHT:int = 40;
      
      public static const BORDER:int = 4;
       
      
      private var _W_F_:GraphicsSolidFill;
      
      private var path_:GraphicsPath;
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      private var _0aq:Shape;
      
      public var _1lh:_1H_T_._yF_;
      
      public var slotId:int;
      
      public var _0E_6:_zL_;
      
      public var blockingItemUpdates:Boolean;
      
      public function _0U_J_(param1:int, param2:_zL_)
      {
         this._W_F_ = new GraphicsSolidFill(this.getBackgroundColor(),1);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._W_F_,this.path_,GraphicHelper.END_FILL];
         super();
         this.slotId = param1;
         this._0E_6 = param2;
         this._0aq = new Shape();
         addChild(this._0aq);
         this.setItemSprite(new _1H_T_._yF_());
      }
      
      public function _1W_A_(param1:Array) : void
      {
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(0,0,WIDTH,HEIGHT,4,param1,this.path_);
         graphics.clear();
         graphics.drawGraphicsData(this.graphicsData_);
         var _loc2_:GraphicsSolidFill = new GraphicsSolidFill(6036765,1);
         GraphicHelper.clearGraphicsPath(this.path_);
         var _loc3_:Vector.<IGraphicsData> = new <IGraphicsData>[_loc2_,this.path_,GraphicHelper.END_FILL];
         GraphicHelper.drawUi(0,0,WIDTH,HEIGHT,4,param1,this.path_);
         this._0aq.graphics.drawGraphicsData(_loc3_);
         this._0aq.cacheAsBitmap = true;
         this._0aq.visible = false;
      }
      
      public function setItem(param1:int) : Boolean
      {
         if(param1 == this._1lh.itemId)
         {
            return false;
         }
         if(this.blockingItemUpdates)
         {
            return true;
         }
         this._1lh.setType(param1);
         this._1K_w(this._0E_6.curPlayer);
         return true;
      }
      
      public function setItemSprite(param1:_1H_T_._yF_) : void
      {
         this._1lh = param1;
         this._1lh.x = WIDTH / 2;
         this._1lh.y = HEIGHT / 2;
         addChild(this._1lh);
      }
      
      public function _1K_w(param1:Player) : void
      {
         if(this._1lh.itemId != _0P_M_._F_p)
         {
            this._0aq.visible = !ObjectLibrary._0pu(this._1lh.itemId,param1);
         }
         else
         {
            this._0aq.visible = false;
         }
      }
      
      public function canHoldItem(param1:int) : Boolean
      {
         return true;
      }
      
      public function _U_m() : void
      {
         this.setItemSprite(this._1lh);
      }
      
      public function getItemId() : int
      {
         return this._1lh.itemId;
      }
      
      protected function getBackgroundColor() : int
      {
         return 5526612;
      }
   }
}
