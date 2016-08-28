package com.company.assembleegameclient.objects
{
   import flash.geom.Vector3D;
   import flash.display.BitmapData;
   import com.company.util.TextureLibrary;
   import com.company.assembleegameclient.engine3d.ObjectFace3D;
   import _V_E_.HWAccelerate;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class ConnectedWall extends ConnectedObject
   {
       
      
      protected var _ct:XML;
      
      protected var _la:Number = 0.5;
      
      protected var _0xs:Number = 0.25;
      
      protected var h_:Number = 1;
      
      protected var _0aL_:Boolean;
      
      protected var _0pD_:Boolean;
      
      public function ConnectedWall(param1:XML)
      {
         super(param1);
         this._ct = param1;
         if(param1.hasOwnProperty("BaseIndent"))
         {
            this._la = 0.5 - Number(param1.BaseIndent);
         }
         if(param1.hasOwnProperty("TopIndent"))
         {
            this._0xs = 0.5 - Number(param1.TopIndent);
         }
         if(param1.hasOwnProperty("Height"))
         {
            this.h_ = Number(param1.Height);
         }
         this._0aL_ = !param1.hasOwnProperty("NoWallTextureRepeat");
         this._0pD_ = !param1.hasOwnProperty("NoTopTextureRepeat");
      }
      
      override protected function buildDot() : void
      {
         var _loc1_:Vector3D = new Vector3D(-this._la,-this._la,0);
         var _loc2_:Vector3D = new Vector3D(this._la,-this._la,0);
         var _loc3_:Vector3D = new Vector3D(this._la,this._la,0);
         var _loc4_:Vector3D = new Vector3D(-this._la,this._la,0);
         var _loc5_:Vector3D = new Vector3D(-this._0xs,-this._0xs,this.h_);
         var _loc6_:Vector3D = new Vector3D(this._0xs,-this._0xs,this.h_);
         var _loc7_:Vector3D = new Vector3D(this._0xs,this._0xs,this.h_);
         var _loc8_:Vector3D = new Vector3D(-this._0xs,this._0xs,this.h_);
         this._T_L_(_loc6_,_loc5_,_loc1_,_loc2_,texture_,true,true);
         this._T_L_(_loc7_,_loc6_,_loc2_,_loc3_,texture_,true,true);
         this._T_L_(_loc5_,_loc8_,_loc4_,_loc1_,texture_,true,true);
         this._T_L_(_loc8_,_loc7_,_loc3_,_loc4_,texture_,true,true);
         var _loc9_:BitmapData = texture_;
         if(this._ct.hasOwnProperty("DotTexture"))
         {
            _loc9_ = TextureLibrary.getBitmap(String(this._ct.DotTexture.File),int(this._ct.DotTexture.Index));
         }
         this._1gy([_loc5_,_loc6_,_loc7_,_loc8_],new <Number>[0.25,0.25,0.75,0.25,0.25,0.75],_loc9_);
      }
      
      override protected function buildShortLine() : void
      {
         var _loc1_:Vector3D = new Vector3D(-this._la,-0.5,0);
         var _loc2_:Vector3D = new Vector3D(this._la,-0.5,0);
         var _loc3_:Vector3D = new Vector3D(this._la,this._la,0);
         var _loc4_:Vector3D = new Vector3D(-this._la,this._la,0);
         var _loc5_:Vector3D = new Vector3D(-this._0xs,-0.5,this.h_);
         var _loc6_:Vector3D = new Vector3D(this._0xs,-0.5,this.h_);
         var _loc7_:Vector3D = new Vector3D(this._0xs,this._0xs,this.h_);
         var _loc8_:Vector3D = new Vector3D(-this._0xs,this._0xs,this.h_);
         this._T_L_(_loc7_,_loc6_,_loc2_,_loc3_,texture_,true,false);
         this._T_L_(_loc5_,_loc8_,_loc4_,_loc1_,texture_,false,true);
         this._T_L_(_loc8_,_loc7_,_loc3_,_loc4_,texture_,true,true);
         var _loc9_:BitmapData = texture_;
         if(this._ct.hasOwnProperty("ShortLineTexture"))
         {
            _loc9_ = TextureLibrary.getBitmap(String(this._ct.ShortLineTexture.File),int(this._ct.ShortLineTexture.Index));
         }
         this._1gy([_loc5_,_loc6_,_loc7_,_loc8_],new <Number>[0.25,0,0.75,0,0.25,0.75],_loc9_);
      }
      
      override protected function buildL() : void
      {
         var _loc1_:Vector3D = new Vector3D(-this._la,-0.5,0);
         var _loc2_:Vector3D = new Vector3D(this._la,-0.5,0);
         var _loc3_:Vector3D = new Vector3D(this._la,-this._la,0);
         var _loc4_:Vector3D = new Vector3D(0.5,-this._la,0);
         var _loc5_:Vector3D = new Vector3D(0.5,this._la,0);
         var _loc6_:Vector3D = new Vector3D(-this._la,this._la,0);
         var _loc7_:Vector3D = new Vector3D(-this._0xs,-0.5,this.h_);
         var _loc8_:Vector3D = new Vector3D(this._0xs,-0.5,this.h_);
         var _loc9_:Vector3D = new Vector3D(this._0xs,-this._0xs,this.h_);
         var _loc10_:Vector3D = new Vector3D(0.5,-this._0xs,this.h_);
         var _loc11_:Vector3D = new Vector3D(0.5,this._0xs,this.h_);
         var _loc12_:Vector3D = new Vector3D(-this._0xs,this._0xs,this.h_);
         this._1w7(_loc9_,_loc8_,_loc2_,_loc3_,texture_,N2,true,true,true);
         this._1w7(_loc10_,_loc9_,_loc3_,_loc4_,texture_,N2,false,true,false);
         this._T_L_(_loc12_,_loc11_,_loc5_,_loc6_,texture_,true,false);
         this._T_L_(_loc7_,_loc12_,_loc6_,_loc1_,texture_,false,true);
         var _loc13_:BitmapData = texture_;
         if(this._ct.hasOwnProperty("LTexture"))
         {
            _loc13_ = TextureLibrary.getBitmap(String(this._ct.LTexture.File),int(this._ct.LTexture.Index));
         }
         this._1gy([_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_],new <Number>[0.25,0,0.75,0,0.25,0.75],_loc13_);
      }
      
      override protected function buildLine() : void
      {
         var _loc1_:Vector3D = new Vector3D(-this._la,-0.5,0);
         var _loc2_:Vector3D = new Vector3D(this._la,-0.5,0);
         var _loc3_:Vector3D = new Vector3D(this._la,0.5,0);
         var _loc4_:Vector3D = new Vector3D(-this._la,0.5,0);
         var _loc5_:Vector3D = new Vector3D(-this._0xs,-0.5,this.h_);
         var _loc6_:Vector3D = new Vector3D(this._0xs,-0.5,this.h_);
         var _loc7_:Vector3D = new Vector3D(this._0xs,0.5,this.h_);
         var _loc8_:Vector3D = new Vector3D(-this._0xs,0.5,this.h_);
         this._T_L_(_loc7_,_loc6_,_loc2_,_loc3_,texture_,false,false);
         this._T_L_(_loc5_,_loc8_,_loc4_,_loc1_,texture_,false,false);
         var _loc9_:BitmapData = texture_;
         if(this._ct.hasOwnProperty("LineTexture"))
         {
            _loc9_ = TextureLibrary.getBitmap(String(this._ct.LineTexture.File),int(this._ct.LineTexture.Index));
         }
         this._1gy([_loc5_,_loc6_,_loc7_,_loc8_],new <Number>[0.25,0,0.75,0,0.25,1],_loc9_);
      }
      
      override protected function buildT() : void
      {
         var _loc1_:Vector3D = new Vector3D(-this._la,-0.5,0);
         var _loc2_:Vector3D = new Vector3D(this._la,-0.5,0);
         var _loc3_:Vector3D = new Vector3D(this._la,-this._la,0);
         var _loc4_:Vector3D = new Vector3D(0.5,-this._la,0);
         var _loc5_:Vector3D = new Vector3D(0.5,this._la,0);
         var _loc6_:Vector3D = new Vector3D(-0.5,this._la,0);
         var _loc7_:Vector3D = new Vector3D(-0.5,-this._la,0);
         var _loc8_:Vector3D = new Vector3D(-this._la,-this._la,0);
         var _loc9_:Vector3D = new Vector3D(-this._0xs,-0.5,this.h_);
         var _loc10_:Vector3D = new Vector3D(this._0xs,-0.5,this.h_);
         var _loc11_:Vector3D = new Vector3D(this._0xs,-this._0xs,this.h_);
         var _loc12_:Vector3D = new Vector3D(0.5,-this._0xs,this.h_);
         var _loc13_:Vector3D = new Vector3D(0.5,this._0xs,this.h_);
         var _loc14_:Vector3D = new Vector3D(-0.5,this._0xs,this.h_);
         var _loc15_:Vector3D = new Vector3D(-0.5,-this._0xs,this.h_);
         var _loc16_:Vector3D = new Vector3D(-this._0xs,-this._0xs,this.h_);
         this._1w7(_loc11_,_loc10_,_loc2_,_loc3_,texture_,N2,true);
         this._1w7(_loc12_,_loc11_,_loc3_,_loc4_,texture_,N2,false);
         this._T_L_(_loc14_,_loc13_,_loc5_,_loc6_,texture_,false,false);
         this._1w7(_loc16_,_loc15_,_loc7_,_loc8_,texture_,N0,true);
         this._1w7(_loc9_,_loc16_,_loc8_,_loc1_,texture_,N0,false);
         var _loc17_:BitmapData = texture_;
         if(this._ct.hasOwnProperty("TTexture"))
         {
            _loc17_ = TextureLibrary.getBitmap(String(this._ct.TTexture.File),int(this._ct.TTexture.Index));
         }
         this._1gy([_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_],new <Number>[0.25,0,0.75,0,0.25,0.25],_loc17_);
      }
      
      override protected function buildCross() : void
      {
         var _loc1_:Vector3D = new Vector3D(-this._la,-0.5,0);
         var _loc2_:Vector3D = new Vector3D(this._la,-0.5,0);
         var _loc3_:Vector3D = new Vector3D(this._la,-this._la,0);
         var _loc4_:Vector3D = new Vector3D(0.5,-this._la,0);
         var _loc5_:Vector3D = new Vector3D(0.5,this._la,0);
         var _loc6_:Vector3D = new Vector3D(this._la,this._la,0);
         var _loc7_:Vector3D = new Vector3D(this._la,0.5,0);
         var _loc8_:Vector3D = new Vector3D(-this._la,0.5,0);
         var _loc9_:Vector3D = new Vector3D(-this._la,this._la,0);
         var _loc10_:Vector3D = new Vector3D(-0.5,this._la,0);
         var _loc11_:Vector3D = new Vector3D(-0.5,-this._la,0);
         var _loc12_:Vector3D = new Vector3D(-this._la,-this._la,0);
         var _loc13_:Vector3D = new Vector3D(-this._0xs,-0.5,this.h_);
         var _loc14_:Vector3D = new Vector3D(this._0xs,-0.5,this.h_);
         var _loc15_:Vector3D = new Vector3D(this._0xs,-this._0xs,this.h_);
         var _loc16_:Vector3D = new Vector3D(0.5,-this._0xs,this.h_);
         var _loc17_:Vector3D = new Vector3D(0.5,this._0xs,this.h_);
         var _loc18_:Vector3D = new Vector3D(this._0xs,this._0xs,this.h_);
         var _loc19_:Vector3D = new Vector3D(this._0xs,0.5,this.h_);
         var _loc20_:Vector3D = new Vector3D(-this._0xs,0.5,this.h_);
         var _loc21_:Vector3D = new Vector3D(-this._0xs,this._0xs,this.h_);
         var _loc22_:Vector3D = new Vector3D(-0.5,this._0xs,this.h_);
         var _loc23_:Vector3D = new Vector3D(-0.5,-this._0xs,this.h_);
         var _loc24_:Vector3D = new Vector3D(-this._0xs,-this._0xs,this.h_);
         this._1w7(_loc15_,_loc14_,_loc2_,_loc3_,texture_,N2,true);
         this._1w7(_loc16_,_loc15_,_loc3_,_loc4_,texture_,N2,false);
         this._1w7(_loc18_,_loc17_,_loc5_,_loc6_,texture_,N4,true);
         this._1w7(_loc19_,_loc18_,_loc6_,_loc7_,texture_,N4,false);
         this._1w7(_loc21_,_loc20_,_loc8_,_loc9_,texture_,N6,true);
         this._1w7(_loc22_,_loc21_,_loc9_,_loc10_,texture_,N6,false);
         this._1w7(_loc24_,_loc23_,_loc11_,_loc12_,texture_,N0,true);
         this._1w7(_loc13_,_loc24_,_loc12_,_loc1_,texture_,N0,false);
         var _loc25_:BitmapData = texture_;
         if(this._ct.hasOwnProperty("CrossTexture"))
         {
            _loc25_ = TextureLibrary.getBitmap(String(this._ct.CrossTexture.File),int(this._ct.CrossTexture.Index));
         }
         this._1gy([_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_,_loc23_,_loc24_],new <Number>[0.25,0,0.75,0,0.25,0.25],_loc25_);
      }
      
      protected function _T_L_(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Vector3D, param5:BitmapData, param6:Boolean, param7:Boolean) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Vector.<Number> = null;
         var _loc11_:int = _0oI_.vL_.length / 3;
         _0oI_.vL_.push(param1.x,param1.y,param1.z,param2.x,param2.y,param2.z,param3.x,param3.y,param3.z,param4.x,param4.y,param4.z);
         var _loc12_:Number = !!param6?Number(-(this._la - this._0xs) / (1 - (this._la - this._0xs) - (!!param7?this._la - this._0xs:0))):Number(0);
         _0oI_.uvts_.push(0,0,0,1,0,0,1,1,0,_loc12_,1,0);
         var _loc13_:ObjectFace3D = new ObjectFace3D(_0oI_,new <int>[_loc11_,_loc11_ + 1,_loc11_ + 2,_loc11_ + 3]);
         _loc13_.texture_ = param5;
         _loc13_.bitmapFill_.repeat = this._0aL_;
         _0oI_.faces_.push(_loc13_);
         if(HWAccelerate._case_(_loc13_.bitmapFill_) == null && Parameters.hwAccel())
         {
            _loc8_ = 0;
            _loc9_ = 0;
            if(param6)
            {
               _loc8_ = _loc12_;
            }
            if(param7)
            {
               _loc9_ = -_loc12_;
            }
            if(_loc9_ == 0 && _loc8_ == 0 && param7 && param4.x == -0.5)
            {
               _loc9_ = 0.34;
            }
            _loc10_ = Vector.<Number>([-0.5,0.5,0,0,0,0.5,0.5,0,1,0,-0.5 + _loc8_,-0.5,0,0,1,0.5 + _loc9_,-0.5,0,1,1]);
            HWAccelerate._1yJ_(_loc13_.bitmapFill_,_loc10_);
         }
      }
      
      protected function _1w7(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Vector3D, param5:BitmapData, param6:Vector3D, param7:Boolean, param8:Boolean = false, param9:Boolean = false) : void
      {
         var _loc10_:Vector.<Number> = null;
         var _loc11_:int = _0oI_.vL_.length / 3;
         _0oI_.vL_.push(param1.x,param1.y,param1.z,param2.x,param2.y,param2.z,param3.x,param3.y,param3.z,param4.x,param4.y,param4.z);
         if(param7)
         {
            _0oI_.uvts_.push(-0.5 + this._0xs,0,0,0,0,0,0,0,0,-0.5 + this._la,1,0);
         }
         else
         {
            _0oI_.uvts_.push(1,0,0,1.5 - this._0xs,0,0,0,0,0,1,1,0);
         }
         var _loc12_:ObjectFace3D = new ObjectFace3D(_0oI_,new <int>[_loc11_,_loc11_ + 1,_loc11_ + 2,_loc11_ + 3]);
         _loc12_.texture_ = param5;
         _loc12_.bitmapFill_.repeat = this._0aL_;
         _loc12_.normalL_ = param6;
         if(!Parameters.hwAccel() && !param8)
         {
            _0oI_.faces_.push(_loc12_);
         }
         else if(param8)
         {
            if(param9)
            {
               _loc10_ = Vector.<Number>([-0.75,0.5,0,0,0,-0.5,0.5,0,1,0,-0.75,-0.5,0,0,1,-0.5,-0.5,0,1,1]);
            }
            else
            {
               _loc10_ = Vector.<Number>([0.5,0.5,0,0,0,0.75,0.5,0,1,0,0.5,-0.5,0,0,1,0.75,-0.5,0,1,1]);
            }
            HWAccelerate._1yJ_(_loc12_.bitmapFill_,_loc10_);
            _0oI_.faces_.push(_loc12_);
         }
      }
      
      protected function _1gy(param1:Array, param2:Vector.<Number>, param3:BitmapData) : void
      {
         var _loc4_:ObjectFace3D = null;
         var _loc5_:Vector.<Number> = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc15_:uint = 0;
         var _loc17_:int = 0;
         var _loc13_:int = _0oI_.vL_.length / 3;
         var _loc14_:Vector.<int> = new Vector.<int>();
         while(_loc15_ < param1.length)
         {
            _0oI_.vL_.push(param1[_loc15_].x,param1[_loc15_].y,param1[_loc15_].z);
            _loc14_.push(_loc13_ + _loc15_);
            if(_loc15_ == 0)
            {
               _0oI_.uvts_.push(param2[0],param2[1],0);
            }
            else if(_loc15_ == 1)
            {
               _0oI_.uvts_.push(param2[2],param2[3],0);
            }
            else if(_loc15_ == param1.length - 1)
            {
               _0oI_.uvts_.push(param2[4],param2[5],0);
            }
            else
            {
               _0oI_.uvts_.push(0,0,0);
            }
            _loc15_++;
         }
         var _loc16_:ObjectFace3D = new ObjectFace3D(_0oI_,_loc14_);
         _loc16_.texture_ = param3;
         _loc16_.bitmapFill_.repeat = this._0pD_;
         _0oI_.faces_.push(_loc16_);
         if(_loc14_.length == 6 && Parameters.hwAccel())
         {
            _loc4_ = new ObjectFace3D(_0oI_,_loc14_);
            _loc4_.texture_ = param3;
            _loc4_.bitmapFill_.repeat = this._0pD_;
            _0oI_.faces_.push(_loc4_);
         }
         if(_loc14_.length == 4 && HWAccelerate._case_(_loc16_.bitmapFill_) == null && Parameters.hwAccel())
         {
            _loc5_ = new Vector.<Number>();
            _loc17_ = 0;
            while(_loc17_ < _loc14_.length)
            {
               if(_loc17_ == 3)
               {
                  _loc6_ = 2;
               }
               else if(_loc17_ == 2)
               {
                  _loc6_ = 3;
               }
               else
               {
                  _loc6_ = _loc17_;
               }
               _loc5_.push(_0oI_.vL_[_loc14_[_loc6_] * 3],_0oI_.vL_[_loc14_[_loc6_] * 3 + 1] * -1,_0oI_.vL_[_loc14_[_loc6_] * 3 + 2],_0oI_.uvts_[_loc14_[_loc6_ != 2?_loc6_:_loc6_ - 1] * 3],_0oI_.uvts_[_loc14_[_loc6_ != 2?_loc6_:_loc6_ + 1] * 3 + 1]);
               _loc17_++;
            }
            HWAccelerate._1yJ_(_loc16_.bitmapFill_,_loc5_);
         }
         else if(_loc14_.length == 6 && HWAccelerate._case_(_loc16_.bitmapFill_) == null && Parameters.hwAccel())
         {
            _loc7_ = [0,1,5,2];
            _loc8_ = [2,3,5,4];
            _loc9_ = [5,0,2,1];
            _loc10_ = 0;
            while(_loc10_ < 2)
            {
               if(_loc10_ == 1)
               {
                  _loc7_ = _loc8_;
               }
               _loc5_ = new Vector.<Number>();
               _loc11_ = 0;
               _loc12_ = 0;
               for each(_loc17_ in _loc7_)
               {
                  if(_loc10_ == 1)
                  {
                     _loc12_ = _loc9_[_loc11_];
                  }
                  else
                  {
                     _loc12_ = _loc17_;
                  }
                  _loc5_.push(_0oI_.vL_[_loc14_[_loc17_] * 3],_0oI_.vL_[_loc14_[_loc17_] * 3 + 1] * -1,_0oI_.vL_[_loc14_[_loc17_] * 3 + 2],_0oI_.uvts_[_loc14_[_loc12_ != 2?_loc12_:_loc12_ - 1] * 3],_0oI_.uvts_[_loc14_[_loc12_ != 2?_loc12_:_loc12_ + 1] * 3 + 1]);
                  _loc11_++;
               }
               if(_loc10_ == 1)
               {
                  HWAccelerate._1yJ_(_loc4_.bitmapFill_,_loc5_);
               }
               else
               {
                  HWAccelerate._1yJ_(_loc16_.bitmapFill_,_loc5_);
               }
               _loc10_++;
            }
         }
      }
   }
}
