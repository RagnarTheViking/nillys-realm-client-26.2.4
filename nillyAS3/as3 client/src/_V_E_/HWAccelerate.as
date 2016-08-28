package _V_E_
{
   import flash.utils.Dictionary;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.display.GraphicsBitmapFill;
   import _0H_6.GameContext;
   import _0cW_.Screen3DHelper;
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display.GraphicsSolidFill;
   
   public class HWAccelerate
   {
      
      private static const _0N_L_:Vector.<Number> = Vector.<Number>([0,0,0,0]);
      
      private static var _groundBitmapFills:Dictionary = new Dictionary();
      
      private static var gndBmpFillCnt:uint = 0;
      
      private static var _098:Dictionary = new Dictionary();
      
      private static var _0yM_:uint = 0;
      
      private static var _1kP_:Dictionary = new Dictionary();
      
      private static var _0E_z:uint = 0;
      
      private static var _U_S_:Dictionary = new Dictionary();
      
      private static var _1S_J_:uint = 0;
      
      private static var _bitmapFills:Dictionary = new Dictionary();
      
      private static var bmpFillCnt:uint = 0;
      
      private static var _solidFills:Dictionary = new Dictionary();
      
      private static var solidFillCnt:uint = 0;
      
      private static var _M_R_:uint = 0;
       
      
      public function HWAccelerate()
      {
         super();
      }
      
      public static function _Q_T_(param1:BitmapData, param2:ColorTransform) : void
      {
         if(!Parameters.hwAccel())
         {
            return;
         }
         if(_1kP_[param1] == null)
         {
            _0E_z++;
         }
         _1kP_[param1] = param2;
      }
      
      public static function _0pL_(param1:BitmapData) : ColorTransform
      {
         var _loc2_:ColorTransform = null;
         if(param1 in _1kP_)
         {
            _loc2_ = _1kP_[param1];
            _1kP_[param1] = new ColorTransform();
         }
         else
         {
            _loc2_ = new ColorTransform();
            _1kP_[param1] = _loc2_;
            _0E_z++;
         }
         return _loc2_;
      }
      
      public static function groundBitmapFill(param1:GraphicsBitmapFill, param2:Number, param3:Number) : void
      {
         if(!Parameters.hwAccel())
         {
            return;
         }
         addGroundBitmapFill(param1);
         _groundBitmapFills[param1][0] = param2;
         _groundBitmapFills[param1][1] = param3;
      }
      
      public static function _8L_(param1:GraphicsBitmapFill) : Vector.<Number>
      {
         if(_groundBitmapFills[param1] != null)
         {
            return _groundBitmapFills[param1];
         }
         return _0N_L_;
      }
      
      private static function addGroundBitmapFill(param1:GraphicsBitmapFill) : void
      {
         if(!Parameters.hwAccel())
         {
            return;
         }
         if(_groundBitmapFills[param1] != null)
         {
            return;
         }
         gndBmpFillCnt++;
         _groundBitmapFills[param1] = Vector.<Number>([0,0,0,0]);
      }
      
      public static function _r9(param1:GraphicsBitmapFill, param2:Number) : void
      {
         if(!Parameters.hwAccel())
         {
            return;
         }
         if(_098[param1] == null)
         {
            _0yM_++;
         }
         _098[param1] = param2;
      }
      
      public static function _ad(param1:GraphicsBitmapFill) : Number
      {
         if(_098[param1] != null && _098[param1] is Number)
         {
            return _098[param1];
         }
         return 0;
      }
      
      public static function _1yJ_(param1:GraphicsBitmapFill, param2:Vector.<Number>) : void
      {
         if(!Parameters.hwAccel())
         {
            return;
         }
         var _loc3_:Screen3DHelper = GameContext.getInjector().getInstance(Screen3DHelper);
         var _loc4_:VertexBuffer3D = _loc3_.getContext().createVertexBuffer(4,5);
         _loc4_.uploadFromVector(param2,0,4);
         _loc3_.getContext().setVertexBufferAt(0,_loc4_,0,Context3DVertexBufferFormat.FLOAT_3);
         _loc3_.getContext().setVertexBufferAt(1,_loc4_,3,Context3DVertexBufferFormat.FLOAT_2);
         if(_U_S_[param1] == null)
         {
            _1S_J_++;
         }
         _U_S_[param1] = _loc4_;
      }
      
      public static function _case_(param1:GraphicsBitmapFill) : VertexBuffer3D
      {
         if(_U_S_[param1] != null && _U_S_[param1] is VertexBuffer3D)
         {
            return _U_S_[param1];
         }
         return null;
      }
      
      public static function _1F_r(param1:GraphicsBitmapFill) : void
      {
         if(!Parameters.hwAccel())
         {
            return;
         }
         if(_098[param1] != null)
         {
            _0yM_--;
            delete _098[param1];
         }
      }
      
      public static function addBitmapFill(param1:GraphicsBitmapFill, param2:Boolean) : void
      {
         if(!Parameters.hwAccel())
         {
            return;
         }
         if(_bitmapFills[param1] == null)
         {
            bmpFillCnt++;
         }
         _bitmapFills[param1] = param2;
      }
      
      public static function hasBitmapFill(param1:GraphicsBitmapFill) : Boolean
      {
         if(_bitmapFills[param1] != null && _bitmapFills[param1] is Boolean)
         {
            return _bitmapFills[param1];
         }
         return false;
      }
      
      public static function addSolidFill(param1:GraphicsSolidFill, param2:Boolean) : void
      {
         if(!Parameters.hwAccel())
         {
            return;
         }
         if(_solidFills[param1] == null)
         {
            solidFillCnt++;
         }
         _solidFills[param1] = param2;
      }
      
      public static function hasSolidFill(param1:GraphicsSolidFill) : Boolean
      {
         if(_solidFills[param1] != null && _solidFills[param1] is Boolean)
         {
            return _solidFills[param1];
         }
         return false;
      }
      
      public static function dispose() : void
      {
         _groundBitmapFills = new Dictionary();
         _098 = new Dictionary();
         _1kP_ = new Dictionary();
         _0zr();
         _bitmapFills = new Dictionary();
         _solidFills = new Dictionary();
         gndBmpFillCnt = 0;
         _0yM_ = 0;
         _0E_z = 0;
         _1S_J_ = 0;
         bmpFillCnt = 0;
         solidFillCnt = 0;
      }
      
      public static function _0zr() : void
      {
         var _loc1_:VertexBuffer3D = null;
         for each(_loc1_ in _U_S_)
         {
            _loc1_.dispose();
         }
         _U_S_ = new Dictionary();
      }
      
      public static function _0A_Q_() : void
      {
         if(_0E_z > 2000)
         {
            _1kP_ = new Dictionary();
            _0E_z = 0;
         }
         if(gndBmpFillCnt > 2000)
         {
            _groundBitmapFills = new Dictionary();
            gndBmpFillCnt = 0;
         }
         if(_0yM_ > 2000)
         {
            _098 = new Dictionary();
            _0yM_ = 0;
         }
         if(_1S_J_ > 1000)
         {
            _0zr();
            _1S_J_ = 0;
         }
         if(bmpFillCnt > 2000)
         {
            _bitmapFills = new Dictionary();
            bmpFillCnt = 0;
         }
         if(solidFillCnt > 2000)
         {
            _solidFills = new Dictionary();
            solidFillCnt = 0;
         }
      }
   }
}
