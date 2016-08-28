package com.company.assembleegameclient.objects
{
   import com.company.assembleegameclient.engine3d.ObjectFace3D;
   import flash.geom.Vector3D;
   import com.company.assembleegameclient.parameters.Parameters;
   import _V_E_.HWAccelerate;
   import flash.display.BitmapData;
   
   public class CaveWall extends ConnectedObject
   {
       
      
      public function CaveWall(param1:XML)
      {
         super(param1);
      }
      
      override protected function buildDot() : void
      {
         var _loc1_:ObjectFace3D = null;
         var _loc2_:Vector3D = new Vector3D(-0.25 - Math.random() * 0.25,-0.25 - Math.random() * 0.25,0);
         var _loc3_:Vector3D = new Vector3D(0.25 + Math.random() * 0.25,-0.25 - Math.random() * 0.25,0);
         var _loc4_:Vector3D = new Vector3D(0.25 + Math.random() * 0.25,0.25 + Math.random() * 0.25,0);
         var _loc5_:Vector3D = new Vector3D(-0.25 - Math.random() * 0.25,0.25 + Math.random() * 0.25,0);
         var _loc6_:Vector3D = new Vector3D(-0.25 + Math.random() * 0.5,-0.25 + Math.random() * 0.5,1);
         this._0wm(null,texture_,_loc6_,_loc2_,_loc3_);
         this._0wm(null,texture_,_loc6_,_loc3_,_loc4_);
         this._0wm(null,texture_,_loc6_,_loc4_,_loc5_);
         this._0wm(null,texture_,_loc6_,_loc5_,_loc2_);
         if(Parameters.hwAccel())
         {
            for each(_loc1_ in _0oI_.faces_)
            {
               HWAccelerate.addBitmapFill(_loc1_.bitmapFill_,true);
            }
         }
      }
      
      override protected function buildShortLine() : void
      {
         var _loc1_:ObjectFace3D = null;
         var _loc2_:Vector3D = this._15s(0,0);
         var _loc3_:Vector3D = this._15s(0,3);
         var _loc4_:Vector3D = new Vector3D(0.25 + Math.random() * 0.25,0.25 + Math.random() * 0.25,0);
         var _loc5_:Vector3D = new Vector3D(-0.25 - Math.random() * 0.25,0.25 + Math.random() * 0.25,0);
         var _loc6_:Vector3D = this._15s(0,1);
         var _loc7_:Vector3D = this._15s(0,2);
         var _loc8_:Vector3D = new Vector3D(Math.random() * 0.25,Math.random() * 0.25,0.5);
         var _loc9_:Vector3D = new Vector3D(Math.random() * -0.25,Math.random() * 0.25,0.5);
         this._0wm(null,texture_,_loc6_,_loc9_,_loc5_,_loc2_);
         this._0wm(null,texture_,_loc9_,_loc8_,_loc4_,_loc5_);
         this._0wm(null,texture_,_loc8_,_loc7_,_loc3_,_loc4_);
         this._0wm(null,texture_,_loc6_,_loc7_,_loc8_,_loc9_);
         if(Parameters.hwAccel())
         {
            for each(_loc1_ in _0oI_.faces_)
            {
               HWAccelerate.addBitmapFill(_loc1_.bitmapFill_,true);
            }
         }
      }
      
      override protected function buildL() : void
      {
         var _loc1_:ObjectFace3D = null;
         var _loc2_:Vector3D = this._15s(0,0);
         var _loc3_:Vector3D = this._15s(0,3);
         var _loc4_:Vector3D = this._15s(1,0);
         var _loc5_:Vector3D = this._15s(1,3);
         var _loc6_:Vector3D = new Vector3D(-Math.random() * 0.25,Math.random() * 0.25,0);
         var _loc7_:Vector3D = this._15s(0,1);
         var _loc8_:Vector3D = this._15s(0,2);
         var _loc9_:Vector3D = this._15s(1,1);
         var _loc10_:Vector3D = this._15s(1,2);
         var _loc11_:Vector3D = new Vector3D(Math.random() * 0.25,-Math.random() * 0.25,1);
         this._0wm(null,texture_,_loc7_,_loc11_,_loc6_,_loc2_);
         this._0wm(null,texture_,_loc11_,_loc10_,_loc5_,_loc6_);
         this._0wm(N2,texture_,_loc9_,_loc8_,_loc3_,_loc4_);
         this._0wm(null,texture_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_);
         if(Parameters.hwAccel())
         {
            for each(_loc1_ in _0oI_.faces_)
            {
               HWAccelerate.addBitmapFill(_loc1_.bitmapFill_,true);
            }
         }
      }
      
      override protected function buildLine() : void
      {
         var _loc1_:ObjectFace3D = null;
         var _loc2_:Vector3D = this._15s(0,0);
         var _loc3_:Vector3D = this._15s(0,3);
         var _loc4_:Vector3D = this._15s(2,3);
         var _loc5_:Vector3D = this._15s(2,0);
         var _loc6_:Vector3D = this._15s(0,1);
         var _loc7_:Vector3D = this._15s(0,2);
         var _loc8_:Vector3D = this._15s(2,2);
         var _loc9_:Vector3D = this._15s(2,1);
         this._0wm(N7,texture_,_loc6_,_loc9_,_loc5_,_loc2_);
         this._0wm(N3,texture_,_loc8_,_loc7_,_loc3_,_loc4_);
         this._0wm(null,texture_,_loc6_,_loc7_,_loc8_,_loc9_);
         if(Parameters.hwAccel())
         {
            for each(_loc1_ in _0oI_.faces_)
            {
               HWAccelerate.addBitmapFill(_loc1_.bitmapFill_,true);
            }
         }
      }
      
      override protected function buildT() : void
      {
         var _loc1_:ObjectFace3D = null;
         var _loc2_:Vector3D = this._15s(0,0);
         var _loc3_:Vector3D = this._15s(0,3);
         var _loc4_:Vector3D = this._15s(1,0);
         var _loc5_:Vector3D = this._15s(1,3);
         var _loc6_:Vector3D = this._15s(3,3);
         var _loc7_:Vector3D = this._15s(3,0);
         var _loc8_:Vector3D = this._15s(0,1);
         var _loc9_:Vector3D = this._15s(0,2);
         var _loc10_:Vector3D = this._15s(1,1);
         var _loc11_:Vector3D = this._15s(1,2);
         var _loc12_:Vector3D = this._15s(3,2);
         var _loc13_:Vector3D = this._15s(3,1);
         this._0wm(N2,texture_,_loc10_,_loc9_,_loc3_,_loc4_);
         this._0wm(null,texture_,_loc12_,_loc11_,_loc5_,_loc6_);
         this._0wm(N0,texture_,_loc8_,_loc13_,_loc7_,_loc2_);
         this._0wm(null,texture_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_);
         if(Parameters.hwAccel())
         {
            for each(_loc1_ in _0oI_.faces_)
            {
               HWAccelerate.addBitmapFill(_loc1_.bitmapFill_,true);
            }
         }
      }
      
      override protected function buildCross() : void
      {
         var _loc1_:ObjectFace3D = null;
         var _loc2_:Vector3D = this._15s(0,0);
         var _loc3_:Vector3D = this._15s(0,3);
         var _loc4_:Vector3D = this._15s(1,0);
         var _loc5_:Vector3D = this._15s(1,3);
         var _loc6_:Vector3D = this._15s(2,3);
         var _loc7_:Vector3D = this._15s(2,0);
         var _loc8_:Vector3D = this._15s(3,3);
         var _loc9_:Vector3D = this._15s(3,0);
         var _loc10_:Vector3D = this._15s(0,1);
         var _loc11_:Vector3D = this._15s(0,2);
         var _loc12_:Vector3D = this._15s(1,1);
         var _loc13_:Vector3D = this._15s(1,2);
         var _loc14_:Vector3D = this._15s(2,2);
         var _loc15_:Vector3D = this._15s(2,1);
         var _loc16_:Vector3D = this._15s(3,2);
         var _loc17_:Vector3D = this._15s(3,1);
         this._0wm(N2,texture_,_loc12_,_loc11_,_loc3_,_loc4_);
         this._0wm(N4,texture_,_loc14_,_loc13_,_loc5_,_loc6_);
         this._0wm(N6,texture_,_loc16_,_loc15_,_loc7_,_loc8_);
         this._0wm(N0,texture_,_loc10_,_loc17_,_loc9_,_loc2_);
         this._0wm(null,texture_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_);
         if(Parameters.hwAccel())
         {
            for each(_loc1_ in _0oI_.faces_)
            {
               HWAccelerate.addBitmapFill(_loc1_.bitmapFill_,true);
            }
         }
      }
      
      protected function _15s(param1:int, param2:int) : Vector3D
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = x_;
         var _loc7_:int = y_;
         var _loc8_:int = (param1 + rotation_) % 4;
         switch(_loc8_)
         {
            case 1:
               _loc6_++;
               break;
            case 2:
               _loc7_++;
         }
         switch(param2)
         {
            case 0:
            case 3:
               _loc3_ = 15 + (_loc6_ * 1259 ^ _loc7_ * 2957) % 35;
               break;
            case 1:
            case 2:
               _loc3_ = 3 + (_loc6_ * 2179 ^ _loc7_ * 1237) % 35;
         }
         switch(param2)
         {
            case 0:
               _loc4_ = -_loc3_ / 100;
               _loc5_ = 0;
               break;
            case 1:
               _loc4_ = -_loc3_ / 100;
               _loc5_ = 1;
               break;
            case 2:
               _loc4_ = _loc3_ / 100;
               _loc5_ = 1;
               break;
            case 3:
               _loc4_ = _loc3_ / 100;
               _loc5_ = 0;
         }
         switch(param1)
         {
            case 0:
               return new Vector3D(_loc4_,-0.5,_loc5_);
            case 1:
               return new Vector3D(0.5,_loc4_,_loc5_);
            case 2:
               return new Vector3D(_loc4_,0.5,_loc5_);
            case 3:
               return new Vector3D(-0.5,_loc4_,_loc5_);
            default:
               return null;
         }
      }
      
      protected function _0wm(param1:Vector3D, param2:BitmapData, ... rest) : void
      {
         var _loc4_:Vector3D = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = _0oI_.vL_.length / 3;
         for each(_loc4_ in rest)
         {
            _0oI_.vL_.push(_loc4_.x,_loc4_.y,_loc4_.z);
         }
         _loc5_ = _0oI_.faces_.length;
         if(rest.length == 4)
         {
            _0oI_.uvts_.push(0,0,0,1,0,0,1,1,0,0,1,0);
            if(Math.random() < 0.5)
            {
               _0oI_.faces_.push(new ObjectFace3D(_0oI_,new <int>[_loc7_,_loc7_ + 1,_loc7_ + 3]),new ObjectFace3D(_0oI_,new <int>[_loc7_ + 1,_loc7_ + 2,_loc7_ + 3]));
            }
            else
            {
               _0oI_.faces_.push(new ObjectFace3D(_0oI_,new <int>[_loc7_,_loc7_ + 2,_loc7_ + 3]),new ObjectFace3D(_0oI_,new <int>[_loc7_,_loc7_ + 1,_loc7_ + 2]));
            }
         }
         else if(rest.length == 3)
         {
            _0oI_.uvts_.push(0,0,0,0,1,0,1,1,0);
            _0oI_.faces_.push(new ObjectFace3D(_0oI_,new <int>[_loc7_,_loc7_ + 1,_loc7_ + 2]));
         }
         else if(rest.length == 5)
         {
            _0oI_.uvts_.push(0.2,0,0,0.8,0,0,1,0.2,0,1,0.8,0,0,0.8,0);
            _0oI_.faces_.push(new ObjectFace3D(_0oI_,new <int>[_loc7_,_loc7_ + 1,_loc7_ + 2,_loc7_ + 3,_loc7_ + 4]));
         }
         else if(rest.length == 6)
         {
            _0oI_.uvts_.push(0,0,0,0.2,0,0,1,0.2,0,1,0.8,0,0,0.8,0,0,0.2,0);
            _0oI_.faces_.push(new ObjectFace3D(_0oI_,new <int>[_loc7_,_loc7_ + 1,_loc7_ + 2,_loc7_ + 3,_loc7_ + 4,_loc7_ + 5]));
         }
         else if(rest.length == 8)
         {
            _0oI_.uvts_.push(0,0,0,0.2,0,0,1,0.2,0,1,0.8,0,0.8,1,0,0.2,1,0,0,0.8,0,0,0.2,0);
            _0oI_.faces_.push(new ObjectFace3D(_0oI_,new <int>[_loc7_,_loc7_ + 1,_loc7_ + 2,_loc7_ + 3,_loc7_ + 4,_loc7_ + 5,_loc7_ + 6,_loc7_ + 7]));
         }
         if(param1 != null || param2 != null)
         {
            _loc6_ = _loc5_;
            while(_loc6_ < _0oI_.faces_.length)
            {
               _0oI_.faces_[_loc6_].normalL_ = param1;
               _0oI_.faces_[_loc6_].texture_ = param2;
               _loc6_++;
            }
         }
      }
   }
}
