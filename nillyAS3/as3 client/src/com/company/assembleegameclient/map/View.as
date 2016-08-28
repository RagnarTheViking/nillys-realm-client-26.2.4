package com.company.assembleegameclient.map
{
   import flash.geom.Vector3D;
   import flash.geom.Rectangle;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.geom.PerspectiveProjection;
   import flash.geom.Matrix3D;
   import flash.display.StageScaleMode;
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.util._0xp;
   
   public class View
   {
      
      public static const _0sh:Vector3D = new Vector3D(0,0,1);
      
      public static const MapRectCentered:Rectangle = new Rectangle(-300,-325,600,600);
      
      public static const MapRectNonCentered:Rectangle = new Rectangle(-300,-450,600,600);
      
      private static const MapRectNoHud:Rectangle = new Rectangle(-400,-325,800,600);
      
      private static const MapRectWide:Rectangle = new Rectangle(-400,-275,800,500);
      
      public static var MapRectFSCentered:Rectangle = new Rectangle(-300,-325,600,600);
      
      public static var MapRectFSNonCentered:Rectangle = new Rectangle(-300,-450,600,600);
       
      
      private const _0v7:Number = 0.5;
      
      private const _0vz:int = 10000;
      
      public var x_:Number;
      
      public var y_:Number;
      
      public var z_:Number;
      
      public var angleRad_:Number;
      
      public var rect:Rectangle;
      
      public var _1N_e:PerspectiveProjection;
      
      public var maxDist:Number;
      
      public var maxSqrDist:Number;
      
      public var Hallucinating:Boolean = false;
      
      public var PartyVision:Boolean = false;
      
      public var XMasVision:Boolean = false;
      
      public var wToS_:Matrix3D;
      
      public var _1o8:Matrix3D;
      
      public var _1P_u:Matrix3D;
      
      private var _5:Matrix3D;
      
      private var _1F_P_:Vector3D;
      
      private var _C___:Vector3D;
      
      private var _0aC_:Vector3D;
      
      private var _1M_m:Vector3D;
      
      private var _zI_:Boolean = false;
      
      private var _16e:Number = 0;
      
      private var _0kN_:Vector.<Number>;
      
      public function View()
      {
         this._1N_e = new PerspectiveProjection();
         this.wToS_ = new Matrix3D();
         this._1o8 = new Matrix3D();
         this._1P_u = new Matrix3D();
         this._5 = new Matrix3D();
         this._1F_P_ = new Vector3D();
         this._C___ = new Vector3D();
         this._0aC_ = new Vector3D();
         this._1M_m = new Vector3D();
         this._0kN_ = new Vector.<Number>(16,true);
         super();
         this._1N_e.focalLength = 3;
         this._1N_e.fieldOfView = 48;
         this._5.appendScale(50,50,50);
         this._C___.x = 0;
         this._C___.y = 0;
         this._C___.z = -1;
      }
      
      public static function resetDimensions() : void
      {
         var _loc1_:Number = Parameters.data_["mscale"];
         var _loc2_:Number = WebMain.sWidth / _loc1_;
         var _loc3_:Number = WebMain.sHeight / _loc1_;
         var _loc4_:Number = !!Parameters.data_["uiscale"]?Number(_loc3_ / 3):Number(200 / _loc1_);
         MapRectFSCentered = new Rectangle((_loc4_ - _loc2_) / 2,-_loc3_ * 13 / 24,_loc2_,_loc3_);
         MapRectFSNonCentered = new Rectangle((_loc4_ - _loc2_) / 2,-_loc3_ * 3 / 4,_loc2_,_loc3_);
      }
      
      public function GetViewingRect(param1:Boolean) : Rectangle
      {
         if(Parameters.data_["stageScale"] == StageScaleMode.NO_SCALE)
         {
            if(param1)
            {
               return MapRectFSCentered;
            }
            return MapRectFSNonCentered;
         }
         if(param1)
         {
            return MapRectCentered;
         }
         return MapRectNonCentered;
      }
      
      public function ConfigureCamera(param1:GameObject, param2:Boolean, param3:Boolean, param4:Boolean) : void
      {
         var _loc5_:Rectangle = this.GetViewingRect(Parameters.data_.centerOnPlayer);
         if(Parameters.HideHud)
         {
            _loc5_ = !!Parameters.Widescreen?MapRectWide:MapRectNoHud;
         }
         this.configure(param1.x_,param1.y_,12,Parameters.data_.cameraAngle,_loc5_);
         this.Hallucinating = param2;
         this.PartyVision = param3;
         this.XMasVision = param4;
      }
      
      public function startJitter() : void
      {
         this._zI_ = true;
         this._16e = 0;
      }
      
      public function update(param1:Number) : void
      {
         if(this._zI_ && this._16e < this._0v7)
         {
            this._16e = this._16e + param1 * this._0v7 / this._0vz;
            if(this._16e > this._0v7)
            {
               this._16e = this._0v7;
            }
         }
      }
      
      public function configure(param1:Number, param2:Number, param3:Number, param4:Number, param5:Rectangle) : void
      {
         if(this._zI_)
         {
            param1 = param1 + _0xp._0__x(this._16e);
            param2 = param2 + _0xp._0__x(this._16e);
         }
         this.x_ = param1;
         this.y_ = param2;
         this.z_ = param3;
         this.angleRad_ = param4;
         this.rect = param5;
         this._1F_P_.x = param1;
         this._1F_P_.y = param2;
         this._1F_P_.z = param3;
         this._1M_m.x = Math.cos(this.angleRad_);
         this._1M_m.y = Math.sin(this.angleRad_);
         this._1M_m.z = 0;
         this._0aC_.x = Math.cos(this.angleRad_ + Math.PI / 2);
         this._0aC_.y = Math.sin(this.angleRad_ + Math.PI / 2);
         this._0aC_.z = 0;
         this._0kN_[0] = this._1M_m.x;
         this._0kN_[1] = this._0aC_.x;
         this._0kN_[2] = this._C___.x;
         this._0kN_[3] = 0;
         this._0kN_[4] = this._1M_m.y;
         this._0kN_[5] = this._0aC_.y;
         this._0kN_[6] = this._C___.y;
         this._0kN_[7] = 0;
         this._0kN_[8] = this._1M_m.z;
         this._0kN_[9] = -1;
         this._0kN_[10] = this._C___.z;
         this._0kN_[11] = 0;
         this._0kN_[12] = -this._1F_P_.dotProduct(this._1M_m);
         this._0kN_[13] = -this._1F_P_.dotProduct(this._0aC_);
         this._0kN_[14] = -this._1F_P_.dotProduct(this._C___);
         this._0kN_[15] = 1;
         this._1o8.rawData = this._0kN_;
         this._1P_u = this._5;
         this.wToS_.identity();
         this.wToS_.append(this._1o8);
         this.wToS_.append(this._1P_u);
         var _loc6_:Number = this.rect.width / (2 * 50);
         var _loc7_:Number = this.rect.height / (2 * 50);
         this.maxDist = Math.sqrt(_loc6_ * _loc6_ + _loc7_ * _loc7_) + 1;
         this.maxSqrDist = this.maxDist * this.maxDist;
      }
   }
}
