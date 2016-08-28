package com.company.assembleegameclient.objects
{
   import flash.display.BitmapData;
   import _0H_6.GameContext;
   import _2l.ClientSettings;
   import com.company.assembleegameclient.util._18Q_;
   import com.company.assembleegameclient.appengine.RemoteTexture;
   import com.company.util.TextureLibrary;
   import _0x1._0wq;
   import com.company.assembleegameclient.util.AnimatedLibrary;
   import com.company.assembleegameclient.util._Z_4;
   import flash.utils.Dictionary;
   
   public class Portrait extends _sV_
   {
       
      
      private var _0K_m:Boolean;
      
      private var remoteTexture:Boolean;
      
      private var texId:String;
      
      public function Portrait(param1:XML)
      {
         var _loc2_:XML = null;
         super();
         this._0K_m = this._0s3();
         if(param1.hasOwnProperty("Texture"))
         {
            this.parse(XML(param1.Texture));
         }
         else if(param1.hasOwnProperty("AnimatedTexture"))
         {
            this.parse(XML(param1.AnimatedTexture));
         }
         else if(param1.hasOwnProperty("RemoteTexture"))
         {
            this.parse(XML(param1.RemoteTexture));
         }
         else if(param1.hasOwnProperty("RandomTexture"))
         {
            this.parse(XML(param1.RandomTexture));
         }
         else
         {
            this.parse(param1);
         }
         for each(_loc2_ in param1.AltTexture)
         {
            this.parse(_loc2_);
         }
         if(param1.hasOwnProperty("Mask"))
         {
            this.parse(XML(param1.Mask));
         }
         if(param1.hasOwnProperty("Effect"))
         {
            this.parse(XML(param1.Effect));
         }
      }
      
      override public function getTexture(param1:int = 0) : BitmapData
      {
         if(_L_4 == null)
         {
            return texture_;
         }
         var _loc2_:_sV_ = _L_4[param1 % _L_4.length];
         return _loc2_.getTexture(param1);
      }
      
      override public function getAltTextureData(param1:int) : _sV_
      {
         if(_1S_r == null)
         {
            return null;
         }
         return _1S_r[param1];
      }
      
      private function _0s3() : Boolean
      {
         var _loc1_:ClientSettings = GameContext.getInjector().getInstance(ClientSettings);
         return _loc1_.UsesRemoteTextures();
      }
      
      private function parse(param1:XML) : void
      {
         var _loc2_:_18Q_ = null;
         var _loc3_:RemoteTexture = null;
         var _loc4_:XML = null;
         var _loc5_:Array = null;
         switch(param1.name().toString())
         {
            case "Texture":
               texture_ = TextureLibrary.getBitmap(String(param1.File),int(param1.Index));
               return;
            case "Mask":
               mask_ = TextureLibrary.getBitmap(String(param1.File),int(param1.Index));
               return;
            case "Effect":
               _0K_7 = new _0wq(param1);
               return;
            case "AnimatedTexture":
               _1vr = AnimatedLibrary._0B_e(String(param1.File),int(param1.Index));
               _loc2_ = _1vr.imageFromAngle(0,_Z_4._M_J_,0);
               texture_ = _loc2_.image_;
               mask_ = _loc2_.mask_;
               return;
            case "RemoteTexture":
               texture_ = TextureLibrary.getBitmap("lofiObj3",255);
               this.remoteTexture = true;
               _loc5_ = param1.Id.split(":");
               this.texId = _loc5_[0];
               if(_loc5_.length > 1)
               {
                  this.texId = _loc5_[1];
               }
               if(this._0K_m)
               {
                  _loc3_ = new RemoteTexture(param1.Id,param1.Instance,this.setTexture);
                  _loc3_.run();
               }
               _E_A_ = !!param1.hasOwnProperty("Right")?int(_Z_4.RIGHT):int(_Z_4.DOWN);
               return;
            case "RandomTexture":
               _L_4 = new Vector.<_sV_>();
               for each(_loc4_ in param1.children())
               {
                  _L_4.push(new Portrait(_loc4_));
               }
               return;
            case "AltTexture":
               if(_1S_r == null)
               {
                  _1S_r = new Dictionary();
               }
               _1S_r[int(param1.@id)] = new Portrait(param1);
               return;
            default:
               return;
         }
      }
      
      public function setTexture(param1:BitmapData, param2:BitmapData = null) : void
      {
         if(param1.width > 16)
         {
            if(param1.height > 16)
            {
               AnimatedLibrary.add("remoteTexture",param1,param2,param1.width / 7,param1.height / 3,param1.width,param1.height,_E_A_);
            }
            else
            {
               AnimatedLibrary.add("remoteTexture",param1,param2,param1.width / 7,param1.height,param1.width,param1.height,_E_A_);
            }
            _1vr = AnimatedLibrary._0B_e("remoteTexture",0);
            texture_ = _1vr.imageFromAngle(0,_Z_4._M_J_,0).image_;
         }
         else
         {
            texture_ = param1;
         }
      }
      
      public function isRemoteTexture() : Boolean
      {
         return this.remoteTexture;
      }
      
      public function id() : String
      {
         return this.texId;
      }
   }
}
