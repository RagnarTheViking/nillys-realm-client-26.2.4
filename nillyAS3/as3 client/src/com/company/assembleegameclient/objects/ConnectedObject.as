package com.company.assembleegameclient.objects
{
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import com.company.assembleegameclient.engine3d.ObjectFace3D;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.map.Square;
   import flash.geom.Utils3D;
   import com.company.assembleegameclient.engine3d._1ee;
   
   public class ConnectedObject extends GameObject
   {
      
      protected static const _1rR_:int = 0;
      
      protected static const _1J_t:int = 1;
      
      protected static const _Q_U_:int = 2;
      
      protected static const _1C_k:int = 3;
      
      protected static const _18G_:int = 4;
      
      protected static const _O_A_:int = 5;
      
      protected static const N0:Vector3D = new Vector3D(-1,-1,0);
      
      protected static const N1:Vector3D = new Vector3D(0,-1,0);
      
      protected static const N2:Vector3D = new Vector3D(1,-1,0);
      
      protected static const N3:Vector3D = new Vector3D(1,0,0);
      
      protected static const N4:Vector3D = new Vector3D(1,1,0);
      
      protected static const N5:Vector3D = new Vector3D(0,1,0);
      
      protected static const N6:Vector3D = new Vector3D(-1,1,0);
      
      protected static const N7:Vector3D = new Vector3D(-1,0,0);
      
      protected static const N8:Vector3D = new Vector3D(0,0,1);
      
      private static var _1bM_:Dictionary = null;
       
      
      protected var rotation_:int = 0;
      
      public function ConnectedObject(param1:XML)
      {
         super(param1);
         hasShadow = false;
      }
      
      private static function init() : void
      {
         _1bM_ = new Dictionary();
         _n0(33686018,_1rR_);
         _n0(16908802,_1J_t);
         _n0(16843266,_Q_U_);
         _n0(16908546,_1C_k);
         _n0(16843265,_18G_);
         _n0(16843009,_O_A_);
      }
      
      private static function _0U_Y_(param1:int) : ConnectedResults
      {
         if(_1bM_ == null)
         {
            init();
         }
         var _loc2_:* = param1 & 252645135;
         return _1bM_[_loc2_];
      }
      
      private static function _n0(param1:int, param2:int) : void
      {
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         while(_loc4_ < 4)
         {
            if(!_1bM_.hasOwnProperty(String(param1)))
            {
               _1bM_[param1] = new ConnectedResults(param2,_loc4_);
               _loc3_ = param1 & 255;
               param1 = param1 >> 8 | _loc3_ << 24;
            }
            _loc4_++;
         }
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         var _loc4_:ObjectFace3D = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:BitmapData = null;
         var _loc8_:Square = null;
         if(_0oI_ == null)
         {
            this._0hp();
         }
         Utils3D.projectVectors(param2.wToS_,_0oI_.vW_,_0oI_.vS_,_0oI_.uvts_);
         for each(_loc4_ in _0oI_.faces_)
         {
            _loc5_ = _loc4_._1U_l.x > 0.4?1:_loc4_._1U_l.x < -0.4?-1:0;
            _loc6_ = _loc4_._1U_l.y > 0.4?1:_loc4_._1U_l.y < -0.4?-1:0;
            _loc7_ = _loc4_.texture_;
            if(_loc5_ != 0 || _loc6_ != 0)
            {
               _loc8_ = map_.lookupSquare(x_ + _loc5_,y_ + _loc6_);
               if(_loc8_ == null || _loc8_.texture_ == null)
               {
                  _loc7_ = null;
               }
            }
            _loc4_.draw(param1,0,_loc7_);
         }
      }
      
      public function _0hp() : void
      {
         _0oI_ = new _1ee();
         var _loc1_:ConnectedResults = _0U_Y_(objectConnection);
         if(_loc1_ == null)
         {
            _0oI_ = null;
            return;
         }
         this.rotation_ = _loc1_.rotation_;
         switch(_loc1_.type_)
         {
            case _1rR_:
               this.buildDot();
               break;
            case _1J_t:
               this.buildShortLine();
               break;
            case _Q_U_:
               this.buildL();
               break;
            case _1C_k:
               this.buildLine();
               break;
            case _18G_:
               this.buildT();
               break;
            case _O_A_:
               this.buildCross();
               break;
            default:
               _0oI_ = null;
               return;
         }
         _0oI_.setPosition(x_,y_,0,this.rotation_ * 90);
      }
      
      protected function buildDot() : void
      {
      }
      
      protected function buildShortLine() : void
      {
      }
      
      protected function buildL() : void
      {
      }
      
      protected function buildLine() : void
      {
      }
      
      protected function buildT() : void
      {
      }
      
      protected function buildCross() : void
      {
      }
   }
}

class ConnectedResults
{
    
   
   public var type_:int;
   
   public var rotation_:int;
   
   function ConnectedResults(param1:int, param2:int)
   {
      super();
      this.type_ = param1;
      this.rotation_ = param2;
   }
}
