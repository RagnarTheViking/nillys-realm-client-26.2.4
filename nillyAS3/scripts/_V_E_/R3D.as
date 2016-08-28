package _V_E_
{
   import _0cW_.Screen3DHelper;
   import _0sx._0F_U_;
   import _wi.Injector;
   import flash.display3D.Program3D;
   import _0sx.Graphic3D;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import flash.display3D.textures.Texture;
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.Context3D;
   import _0gO_._1v0;
   import _0B_y.AGALMiniAssembler;
   import flash.display3D.Context3DProgramType;
   import flash.utils.ByteArray;
   import flash.display3D.Context3DTextureFormat;
   import com.company.assembleegameclient.map.View;
   import flash.display.IGraphicsData;
   import _0gO_.Object3D;
   import flash.display.StageScaleMode;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.display.Stage3D;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.Context3DTriangleFace;
   import flash.display.GraphicsBitmapFill;
   import flash.display.GraphicsGradientFill;
   
   public class R3D
   {
      
      public static const STAGE3D_FILTER_PAUSE:uint = 1;
      
      public static const STAGE3D_FILTER_BLIND:uint = 2;
      
      public static const STAGE3D_FILTER_DRUNK:uint = 3;
      
      private static const _R_1:Vector.<Number> = new <Number>[1,2,0,0];
      
      private static const _1xO_:Vector.<Number> = new <Number>[0.3,0.59,0.11,0];
      
      private static const _ei:Vector.<Number> = new <Number>[0.05,0.05,0.05,0];
      
      private static const _0H_k:Vector.<Number> = new <Number>[-1,1,0,0,1,1,1,0,1,-1,1,1,-1,-1,0,1];
      
      private static const _0K_9:Vector.<uint> = new <uint>[0,2,3,0,1,2];
      
      public static var Ready:Boolean;
       
      
      [Inject]
      public var context3D:Screen3DHelper;
      
      [Inject]
      public var _0Z_V_:_0F_U_;
      
      [Inject]
      public var _T_X_:Injector;
      
      private var _pXOffset:Number;
      
      private var _pYOffset:Number;
      
      public var _02y:Program3D;
      
      private var _0L_5:Program3D;
      
      private var _168:Program3D;
      
      private var _M_o:Program3D;
      
      private var _5N_:Graphic3D;
      
      protected var _0e:Matrix3D;
      
      protected var _14x:Matrix3D;
      
      private var _1F_P_:Vector3D;
      
      private var _C___:Vector3D;
      
      private var _0aC_:Vector3D;
      
      private var _1M_m:Vector3D;
      
      private var _0kN_:Vector.<Number>;
      
      protected var centerWidth:Number;
      
      protected var centerHeight:Number;
      
      private var stageWidth:Number = 600;
      
      private var stageHeight:Number = 600;
      
      private var _filterTexture:Texture;
      
      private var _0dz:Number = 0.01;
      
      private var _0D_o:VertexBuffer3D;
      
      private var _0sl:IndexBuffer3D;
      
      protected var _1yX_:String;
      
      protected var _11W_:String;
      
      protected var _1Y_v:Vector.<Number>;
      
      public function R3D(param1:_1Z_O_)
      {
         this._14x = new Matrix3D();
         this._1F_P_ = new Vector3D();
         this._C___ = new Vector3D();
         this._0aC_ = new Vector3D();
         this._1M_m = new Vector3D();
         this._0kN_ = new Vector.<Number>(16,true);
         this._1yX_ = ["m44 op, va0, vc0","m44 v0, va0, vc8","m44 v1, va1, vc8","mov v2, va2"].join("\n");
         this._11W_ = ["tex oc, v2, fs0 <2d,clamp>"].join("\n");
         this._1Y_v = Vector.<Number>([0.4,0.6,0.4,1.5]);
         super();
         Ready = false;
         this.resetPlayerOffset();
         param1.add(this.draw);
      }
      
      public function init(param1:Context3D) : void
      {
         this._0e = _1v0._0h(56,1,0.1,2048);
         var _loc2_:AGALMiniAssembler = new AGALMiniAssembler();
         _loc2_._11r(Context3DProgramType.VERTEX,this._1yX_);
         var _loc3_:AGALMiniAssembler = new AGALMiniAssembler();
         _loc3_._11r(Context3DProgramType.FRAGMENT,this._11W_);
         this._02y = param1.createProgram();
         this._02y.upload(_loc2_._1r0,_loc3_._1r0);
         var _loc4_:* = "tex ft0, v0, fs0 <2d,clamp,linear>\n" + "dp3 ft0.x, ft0, fc0\n" + "mov ft0.y, ft0.x\n" + "mov ft0.z, ft0.x\n" + "mov oc, ft0\n";
         var _loc5_:* = "mov op, va0\n" + "add vt0, vc0.xxxx, va0\n" + "div vt0, vt0, vc0.yyyy\n" + "sub vt0.y, vc0.x, vt0.y\n" + "mov v0, vt0\n";
         var _loc6_:AGALMiniAssembler = new AGALMiniAssembler();
         _loc6_._11r(Context3DProgramType.VERTEX,_loc5_);
         var _loc7_:ByteArray = _loc6_._1r0;
         _loc6_._11r(Context3DProgramType.FRAGMENT,_loc4_);
         var _loc8_:ByteArray = _loc6_._1r0;
         this._0L_5 = param1.createProgram();
         this._0L_5.upload(_loc7_,_loc8_);
         var _loc9_:* = "sub ft0, v0, fc0\n" + "sub ft0.zw, ft0.zw, ft0.zw\n" + "dp3 ft1, ft0, ft0\n" + "sqt ft1, ft1\n" + "div ft1.xy, ft1.xy, fc0.zz\n" + "pow ft1.x, ft1.x, fc0.w\n" + "mul ft0.xy, ft0.xy, ft1.xx\n" + "div ft0.xy, ft0.xy, ft1.yy\n" + "add ft0.xy, ft0.xy, fc0.xy\n" + "tex oc, ft0, fs0<2d,clamp>\n";
         var _loc10_:* = "m44 op, va0, vc0\n" + "mov v0, va1\n";
         _loc6_._11r(Context3DProgramType.VERTEX,_loc10_);
         var _loc11_:ByteArray = _loc6_._1r0;
         _loc6_._11r(Context3DProgramType.FRAGMENT,_loc9_);
         var _loc12_:ByteArray = _loc6_._1r0;
         this._168 = param1.createProgram();
         this._168.upload(_loc11_,_loc12_);
         var _loc13_:* = "m44 op, va0, vc0\n" + "mov v0, va1\n" + "mov v1, va2\n";
         _loc6_._11r(Context3DProgramType.VERTEX,_loc13_);
         var _loc14_:ByteArray = _loc6_._1r0;
         var _loc15_:* = "sub ft0.xy, v1.xy, fc4.xx\n" + "mul ft0.xy, ft0.xy, ft0.xy\n" + "add ft0.x, ft0.x, ft0.y\n" + "slt ft0.y, ft0.x, fc4.y\n" + "mul oc, v0, ft0.yyyy\n";
         _loc6_._11r(Context3DProgramType.FRAGMENT,_loc15_);
         var _loc16_:ByteArray = _loc6_._1r0;
         this._M_o = param1.createProgram();
         this._M_o.upload(_loc14_,_loc16_);
         this._filterTexture = param1.createTexture(1024,1024,Context3DTextureFormat.BGRA,true);
         this._0D_o = param1.createVertexBuffer(4,4);
         this._0D_o.uploadFromVector(_0H_k,0,4);
         this._0sl = param1.createIndexBuffer(6);
         this._0sl.uploadFromVector(_0K_9,0,6);
         this._5N_ = this._T_X_.getInstance(Graphic3D);
      }
      
      private function configure(param1:View) : void
      {
         var _loc2_:Number = -param1.angleRad_;
         this._C___.x = 0;
         this._C___.y = 0;
         this._C___.z = -1;
         this._1F_P_.x = -param1.x_ - this.centerWidth;
         this._1F_P_.y = param1.y_ - this.centerHeight;
         this._1F_P_.z = -param1.z_;
         this._1M_m.x = Math.cos(_loc2_);
         this._1M_m.y = Math.sin(_loc2_);
         this._1M_m.z = 0;
         this._0aC_.x = Math.cos(_loc2_ + Math.PI / 2);
         this._0aC_.y = Math.sin(_loc2_ + Math.PI / 2);
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
         this._0kN_[9] = 1;
         this._0kN_[10] = -this._C___.z;
         this._0kN_[11] = 0;
         this._0kN_[12] = this._1F_P_.dotProduct(this._1M_m);
         this._0kN_[13] = this._1F_P_.dotProduct(this._0aC_);
         this._0kN_[14] = -this._1F_P_.dotProduct(this._C___);
         this._0kN_[15] = 1;
         var _loc3_:Matrix3D = new Matrix3D();
         _loc3_.rawData = this._0kN_;
         this._14x.identity();
         this._14x.append(_loc3_);
      }
      
      private function draw(param1:Vector.<IGraphicsData>, param2:Vector.<Object3D>, param3:Number, param4:Number, param5:View, param6:uint) : void
      {
         WebMain.stage_.scaleMode = StageScaleMode.NO_SCALE;
         if(WebMain.stage_.stageWidth != this.stageWidth || WebMain.stage_.stageHeight != this.stageHeight)
         {
            this.configureView();
         }
         if(Ready == true)
         {
            this.getPlayerOffset();
         }
         else
         {
            this.resetPlayerOffset();
         }
         if(param6 > 0)
         {
            this.drawSE(param1,param2,param3,param4,param5,param6);
         }
         else
         {
            this.drawNSE(param1,param2,param3,param4,param5);
         }
         this.context3D.present();
         if(Parameters.data_["stageScale"] != StageScaleMode.NO_SCALE)
         {
            WebMain.stage_.scaleMode = StageScaleMode.EXACT_FIT;
         }
      }
      
      private function configureView() : void
      {
         if(WebMain.stage_.stageWidth < 1 || WebMain.stage_.stageHeight < 1)
         {
            return;
         }
         var _loc1_:Stage3D = WebMain.stage_.stage3Ds[0];
         _loc1_.context3D.configureBackBuffer(WebMain.stage_.stageWidth,WebMain.stage_.stageHeight,2,false);
         this.stageWidth = WebMain.stage_.stageWidth;
         this.stageHeight = WebMain.stage_.stageHeight;
      }
      
      private function drawSE(param1:Vector.<IGraphicsData>, param2:Vector.<Object3D>, param3:Number, param4:Number, param5:View, param6:uint) : void
      {
         this.context3D.getContext().setRenderToTexture(this._filterTexture,true);
         this.drawNSE(param1,param2,param3,param4,param5);
         this.context3D.getContext().setRenderToBackBuffer();
         switch(param6)
         {
            case STAGE3D_FILTER_PAUSE:
            case STAGE3D_FILTER_BLIND:
               this.context3D.getContext().setProgram(this._0L_5);
               this.context3D.getContext().setTextureAt(0,this._filterTexture);
               this.context3D.getContext().clear(0.5,0.5,0.5);
               this.context3D.getContext().setVertexBufferAt(0,this._0D_o,0,Context3DVertexBufferFormat.FLOAT_2);
               this.context3D.getContext().setVertexBufferAt(1,null);
               break;
            case STAGE3D_FILTER_DRUNK:
               this.context3D.getContext().setProgram(this._168);
               this.context3D.getContext().setTextureAt(0,this._filterTexture);
               this.context3D.getContext().clear(0.5,0.5,0.5);
               this.context3D.getContext().setVertexBufferAt(0,this._0D_o,0,Context3DVertexBufferFormat.FLOAT_2);
               this.context3D.getContext().setVertexBufferAt(1,this._0D_o,2,Context3DVertexBufferFormat.FLOAT_2);
         }
         this.context3D.getContext().setVertexBufferAt(2,null);
         switch(param6)
         {
            case STAGE3D_FILTER_PAUSE:
               this.context3D.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,_R_1);
               this.context3D.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,_1xO_);
               break;
            case STAGE3D_FILTER_BLIND:
               this.context3D.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,_R_1);
               this.context3D.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,_ei);
               break;
            case STAGE3D_FILTER_DRUNK:
               if(this._1Y_v[3] <= 0.2 || this._1Y_v[3] >= 1.8)
               {
                  this._0dz = this._0dz * -1;
               }
               this._1Y_v[3] = this._1Y_v[3] + this._0dz;
               this.context3D.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,new Matrix3D());
               this.context3D.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this._1Y_v,this._1Y_v.length / 4);
         }
         this.context3D.getContext().clear(0,0,0,1);
         this.context3D.getContext().drawTriangles(this._0sl);
      }
      
      private function drawNSE(param1:Vector.<IGraphicsData>, param2:Vector.<Object3D>, param3:Number, param4:Number, param5:View) : void
      {
         var test:int = 0;
         var graphicsData:IGraphicsData = null;
         var index3d:uint = 0;
         var graphicsDatas:Vector.<IGraphicsData> = param1;
         var grahpicsData3d:Vector.<Object3D> = param2;
         var mapWidth:Number = param3;
         var mapHeight:Number = param4;
         var camera:View = param5;
         this.context3D.clear();
         var finalTransform:Matrix3D = new Matrix3D();
         this.centerWidth = -mapWidth / 2;
         this.centerHeight = mapHeight / 2;
         this.configure(camera);
         var mScale:Number = Parameters.data_["mscale"];
         for each(graphicsData in graphicsDatas)
         {
            this.context3D.getContext().setCulling(Context3DTriangleFace.NONE);
            if(graphicsData is GraphicsBitmapFill && !HWAccelerate.hasBitmapFill(GraphicsBitmapFill(graphicsData)))
            {
               try
               {
                  test = GraphicsBitmapFill(graphicsData).bitmapData.width;
               }
               catch(e:Error)
               {
                  continue;
               }
               this._5N_._0E_7(GraphicsBitmapFill(graphicsData),this.context3D);
               finalTransform.identity();
               finalTransform.append(this._5N_._nS_());
               finalTransform.appendScale(1 / Screen3D.HalfWidth,1 / Screen3D.HalfHeight,1);
               finalTransform.appendTranslation(this._pXOffset / Screen3D.Width,this._pYOffset / Screen3D.Height,0);
               this.context3D.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,finalTransform,true);
               this._5N_._0Q_Y_(this.context3D);
            }
            if(graphicsData is GraphicsGradientFill)
            {
               this.context3D.getContext().setProgram(this._M_o);
               this._5N_._0__9(GraphicsGradientFill(graphicsData),this.context3D,Screen3D.HalfWidth,Screen3D.HalfHeight);
               finalTransform.identity();
               finalTransform.append(this._5N_._nS_());
               finalTransform.appendTranslation(this._pXOffset / Screen3D.Width,this._pYOffset / Screen3D.Height,0);
               this.context3D.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,finalTransform,true);
               this.context3D.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,4,Vector.<Number>([0.5,0.25,0,0]));
               this._5N_._10m(this.context3D);
            }
            if(graphicsData == null && grahpicsData3d.length != 0)
            {
               try
               {
                  this.context3D.getContext().setProgram(this._02y);
                  this.context3D.getContext().setCulling(Context3DTriangleFace.BACK);
                  grahpicsData3d[index3d].UpdateModelMatrix(this.centerWidth,this.centerHeight);
                  finalTransform.identity();
                  finalTransform.append(grahpicsData3d[index3d].GetModelMatrix());
                  finalTransform.append(this._14x);
                  finalTransform.append(this._0e);
                  finalTransform.appendTranslation(this._pXOffset / Screen3D.Width,this._pYOffset / Screen3D.Height * 11.5,0);
                  this.context3D.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,finalTransform,true);
                  this.context3D.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,8,grahpicsData3d[index3d].GetModelMatrix(),true);
                  grahpicsData3d[index3d].draw(this.context3D.getContext());
                  index3d++;
               }
               catch(e:Error)
               {
                  continue;
               }
            }
         }
      }
      
      private function getPlayerOffset() : void
      {
         this._pXOffset = -200 / Parameters.data_["mscale"];
         this._pYOffset = !!Parameters.data_.centerOnPlayer?Number(-50):Number((View.MapRectFSNonCentered.y + View.MapRectFSCentered.height / 2) * 2);
      }
      
      private function resetPlayerOffset() : void
      {
         this._pXOffset = -200;
         this._pYOffset = 0;
      }
   }
}
