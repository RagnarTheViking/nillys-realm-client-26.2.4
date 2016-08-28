package _1H_T_
{
   import flash.filters.ColorMatrixFilter;
   import com.company.util.MoreColorUtil;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.display.BitmapData;
   import com.company.util.TextureLibrary;
   import _1pm._0P_M_;
   import com.company.assembleegameclient.objects.Player;
   import _1O_n._zL_;
   
   public class _1Z_h extends _S_A_
   {
      
      private static const _0____:ColorMatrixFilter = new ColorMatrixFilter(MoreColorUtil._U_W_(3552822));
       
      
      public var _0tz:Bitmap;
      
      public var itemType:int;
      
      private var _f6:int;
      
      public function _1Z_h(param1:int, param2:_zL_, param3:Boolean)
      {
         super(param1,param2,param3);
      }
      
      override public function canHoldItem(param1:int) : Boolean
      {
         return param1 <= 0 || this.itemType == ObjectLibrary._zV_(param1);
      }
      
      public function setType(param1:int) : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         switch(param1)
         {
            case _0P_M_._0H_3:
               break;
            case _0P_M_._rW_:
               _loc2_ = TextureLibrary.getBitmap("lofiObj5",48);
               break;
            case _0P_M_._0P_v:
               _loc2_ = TextureLibrary.getBitmap("lofiObj5",96);
               break;
            case _0P_M_._08B_:
               _loc2_ = TextureLibrary.getBitmap("lofiObj5",80);
               break;
            case _0P_M_._0F_t:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",80);
               break;
            case _0P_M_._06l:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",112);
               break;
            case _0P_M_._0aQ_:
               _loc2_ = TextureLibrary.getBitmap("lofiObj5",0);
               break;
            case _0P_M_._try:
               _loc2_ = TextureLibrary.getBitmap("lofiObj5",32);
               break;
            case _0P_M_._za:
               _loc2_ = TextureLibrary.getBitmap("lofiObj5",64);
               break;
            case _0P_M_._0D_w:
               _loc2_ = TextureLibrary.getBitmap("lofiObj",44);
               break;
            case _0P_M_._0oB_:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",64);
               break;
            case _0P_M_._1J_L_:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",160);
               break;
            case _0P_M_._1v5:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",32);
               break;
            case _0P_M_._1S_L_:
               _loc2_ = TextureLibrary.getBitmap("lofiObj5",16);
               break;
            case _0P_M_._1__5:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",48);
               break;
            case _0P_M_._0T_K_:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",96);
               break;
            case _0P_M_._4m:
               _loc2_ = TextureLibrary.getBitmap("lofiObj5",112);
               break;
            case _0P_M_._0xa:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",128);
               break;
            case _0P_M_._0gQ_:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",0);
               break;
            case _0P_M_._0y0:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",16);
               break;
            case _0P_M_._0B_9:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",144);
               break;
            case _0P_M_._Q_V_:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",176);
               break;
            case _0P_M_._1N_F_:
               _loc2_ = TextureLibrary.getBitmap("lofiObj6",192);
               break;
            case _0P_M_._Y_7:
               _loc2_ = TextureLibrary.getBitmap("lofiObj3",540);
               break;
            case _0P_M_._1F_k:
               _loc2_ = TextureLibrary.getBitmap("lofiObj3",555);
         }
         if(_loc2_ != null)
         {
            this._0tz = new Bitmap(_loc2_);
            this._0tz.x = BORDER;
            this._0tz.y = BORDER;
            this._0tz.scaleX = 4;
            this._0tz.scaleY = 4;
            this._0tz.filters = [_0____];
            addChildAt(this._0tz,0);
         }
         this.itemType = param1;
      }
      
      override public function setItem(param1:int) : Boolean
      {
         var _loc2_:Boolean = super.setItem(param1);
         if(_loc2_)
         {
            this._0tz.visible = _1lh.itemId <= 0;
            this._11e();
         }
         return _loc2_;
      }
      
      private function _11e() : void
      {
         var _loc1_:XML = null;
         this._f6 = 0;
         if(_1lh.itemId > 0)
         {
            _loc1_ = ObjectLibrary.XmlData[_1lh.itemId];
            if(_loc1_ && _loc1_.hasOwnProperty("Usable"))
            {
               if(_loc1_.hasOwnProperty("MultiPhase"))
               {
                  this._f6 = _loc1_.MpEndCost;
               }
               else
               {
                  this._f6 = _loc1_.MpCost;
               }
            }
         }
      }
      
      public function updateDim(param1:Player) : void
      {
         _1lh.setDim(param1 && param1.mp_ < this._f6);
      }
      
      override protected function beginDragCallback() : void
      {
         this._0tz.visible = true;
      }
      
      override protected function endDragCallback() : void
      {
         this._0tz.visible = _1lh.itemId <= 0;
      }
      
      override protected function getBackgroundColor() : int
      {
         return 4539717;
      }
   }
}
