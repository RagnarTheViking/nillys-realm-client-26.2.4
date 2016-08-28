package com.company.assembleegameclient.map
{
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import flash.display.BitmapData;
   import _0da._K_b;
   import com.company.assembleegameclient.objects.BasicObject;
   import flash.utils.Dictionary;
   import flash.display.DisplayObject;
   import flash.display.IGraphicsData;
   import _0gO_.Object3D;
   import _05G_.Background;
   import com.company.assembleegameclient.objects.GameObject;
   import _0sx._0F_U_;
   import _V_E_.HWAccelerate;
   import _0sx._1G_f;
   import flash.geom.Point;
   import _0x1.ParticleEffect;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.geom.Rectangle;
   import flash.display.StageScaleMode;
   import flash.display.Stage3D;
   import _V_E_.Screen3D;
   import _V_E_.R3D;
   import _0H_6.GameContext;
   import _V_E_._1Z_O_;
   import flash.display.GraphicsBitmapFill;
   import flash.display.GraphicsSolidFill;
   import com.company.assembleegameclient.util.ConditionEffect;
   import flash.filters.BlurFilter;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import _113.MapOverlay;
   import _0bE_.PartyOverlay;
   import com.company.assembleegameclient.objects.PlayerList;
   import _ge._v1;
   
   public class Map extends _76
   {
      
      public static const _ClothBazaar:String = "Cloth Bazaar";
      
      public static const _Nexus:String = "Nexus";
      
      public static const _DailyQuestRoom:String = "Daily Quest Room";
      
      public static const PET_YARD_1:String = "Pet Yard";
      
      public static const PET_YARD_2:String = "Pet Yard 2";
      
      public static const PET_YARD_3:String = "Pet Yard 3";
      
      public static const PET_YARD_4:String = "Pet Yard 4";
      
      public static const PET_YARD_5:String = "Pet Yard 5";
      
      public static const _GuildHall:String = "Guild Hall";
      
      public static const _NexusExplaination:String = "Nexus_Explanation";
      
      public static const _Vault:String = "Vault";
      
      public static const _Marketplace:String = "Marketplace";
      
      private static const SortParameters:Array = ["sortVal_","objectId_"];
      
      private static const SortTypes:Array = [Array.NUMERIC,Array.NUMERIC];
      
      protected static const BlindFilter:ColorMatrixFilter = new ColorMatrixFilter([0.05,0.05,0.05,0,0,0.05,0.05,0.05,0,0,0.05,0.05,0.05,0,0,0.05,0.05,0.05,1,0]);
      
      public static var swAccel:Boolean = false;
      
      protected static var RedDangerOverlay:ColorTransform = new ColorTransform(255 / 255,55 / 255,0 / 255,0);
      
      public static var texture:BitmapData;
       
      
      private var _q1:_K_b;
      
      private var _updatingObjects:Boolean = false;
      
      private var _addObjectQueue:Vector.<BasicObject>;
      
      private var _removeObjectQueue:Vector.<int>;
      
      private var SoftwareAccelMaps:Dictionary;
      
      private var _empty3dData:Boolean = false;
      
      private var darknessOverlay_:DisplayObject;
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      private var graphics3dData_:Vector.<IGraphicsData>;
      
      private var objects3D:Vector.<Object3D>;
      
      public var visibleObjs:Array;
      
      public var visibleHitObjs:Array;
      
      public var visibleGroundObjs:Array;
      
      public var tiles:Vector.<com.company.assembleegameclient.map.Square>;
      
      public var sqrAnimations:Vector.<com.company.assembleegameclient.map.Square>;
      
      public function Map(param1:GameSpriteBase)
      {
         this._addObjectQueue = new Vector.<BasicObject>();
         this._removeObjectQueue = new Vector.<int>();
         this.SoftwareAccelMaps = new Dictionary();
         this.graphicsData_ = new Vector.<IGraphicsData>();
         this.graphics3dData_ = new Vector.<IGraphicsData>();
         this.objects3D = new Vector.<Object3D>();
         this.visibleObjs = new Array();
         this.visibleHitObjs = new Array();
         this.visibleGroundObjs = new Array();
         this.tiles = new Vector.<com.company.assembleegameclient.map.Square>();
         this.sqrAnimations = new Vector.<com.company.assembleegameclient.map.Square>();
         super();
         gs_ = param1;
         breathOverlay_ = new BreathOverlay();
         this.darknessOverlay_ = new DarknessOverlay();
         sideBarGradient = new SideBarGradient();
         mapOverlay_ = new MapOverlay();
         partyOverlay_ = new PartyOverlay(this);
         playerList_ = new PlayerList(this);
         quest_ = new Quest(this);
         this._q1 = GameContext.getInjector().getInstance(_K_b);
         GameContext.getInjector().getInstance(_v1).gameObjects = goDict_;
         hwAccel = Parameters.hwAccel();
      }
      
      override public function setProps(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:Boolean) : void
      {
         width_ = param1;
         height_ = param2;
         name_ = param3;
         _1I_q = param4;
         allowPlayerTeleport_ = param5;
         showDisplays_ = param6;
         this.checkAccel(name_);
      }
      
      private function checkAccel(param1:String) : void
      {
         swAccel = this.SoftwareAccelMaps[param1] != null || WebMain.stage_.stage3Ds[0].context3D == null;
      }
      
      override public function initialize() : void
      {
         squares_.length = width_ * height_;
         background_ = Background._H_f(_1I_q);
         if(background_ != null)
         {
            addChild(background_);
         }
         addChild(map_);
         addChild(breathOverlay_);
         addChild(this.darknessOverlay_);
         addChild(sideBarGradient);
         addChild(mapOverlay_);
         addChild(partyOverlay_);
         isPetYard = name_.substr(0,8) == "PetYard";
      }
      
      override public function resetOverlays() : void
      {
         if(contains(breathOverlay_))
         {
            removeChild(breathOverlay_);
         }
         if(contains(this.darknessOverlay_))
         {
            removeChild(this.darknessOverlay_);
         }
         breathOverlay_ = new BreathOverlay(gs_);
         this.darknessOverlay_ = new DarknessOverlay(gs_);
         addChild(breathOverlay_);
         addChild(this.darknessOverlay_);
      }
      
      override public function dispose() : void
      {
         var _loc1_:com.company.assembleegameclient.map.Square = null;
         var _loc2_:GameObject = null;
         var _loc3_:BasicObject = null;
         gs_ = null;
         background_ = null;
         map_ = null;
         breathOverlay_ = null;
         this.darknessOverlay_ = null;
         sideBarGradient = null;
         mapOverlay_ = null;
         partyOverlay_ = null;
         for each(_loc1_ in _0bx)
         {
            _loc1_.dispose();
         }
         _0bx.length = 0;
         _0bx = null;
         squares_.length = 0;
         squares_ = null;
         for each(_loc2_ in goDict_)
         {
            _loc2_.dispose();
         }
         goDict_ = null;
         for each(_loc3_ in oDict_)
         {
            _loc3_.dispose();
         }
         oDict_ = null;
         merchLookup_ = null;
         player_ = null;
         playerList_ = null;
         quest_ = null;
         this._addObjectQueue = null;
         this._removeObjectQueue = null;
         _0F_U_._1S_l();
         HWAccelerate.dispose();
         _1G_f.getInstance().dispose();
      }
      
      override public function update(param1:int, param2:int) : void
      {
         var _loc3_:BasicObject = null;
         var _loc4_:int = 0;
         this._updatingObjects = true;
         for each(_loc3_ in goDict_)
         {
            if(!_loc3_.update(param1,param2))
            {
               this._removeObjectQueue.push(_loc3_.objectId_);
            }
         }
         for each(_loc3_ in oDict_)
         {
            if(!_loc3_.update(param1,param2))
            {
               this._removeObjectQueue.push(_loc3_.objectId_);
            }
         }
         this._updatingObjects = false;
         for each(_loc3_ in this._addObjectQueue)
         {
            this.internalAddObj(_loc3_);
         }
         this._addObjectQueue.length = 0;
         for each(_loc4_ in this._removeObjectQueue)
         {
            this.internalRemoveObj(_loc4_);
         }
         this._removeObjectQueue.length = 0;
         playerList_.update(param1,param2);
      }
      
      override public function pSTopW(param1:Number, param2:Number) : Point
      {
         var _loc3_:com.company.assembleegameclient.map.Square = null;
         for each(_loc3_ in this.tiles)
         {
            if(_loc3_.faces_.length != 0 && _loc3_.faces_[0].face_.contains(param1,param2))
            {
               return new Point(_loc3_.center_.x,_loc3_.center_.y);
            }
         }
         return null;
      }
      
      override public function setGroundTile(param1:int, param2:int, param3:uint) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:com.company.assembleegameclient.map.Square = null;
         var _loc7_:com.company.assembleegameclient.map.Square = this.getSquare(param1,param2);
         _loc7_._fY_(param3);
         var _loc8_:int = param1 < width_ - 1?int(param1 + 1):int(param1);
         var _loc9_:int = param2 < height_ - 1?int(param2 + 1):int(param2);
         var _loc10_:int = param1 > 0?int(param1 - 1):int(param1);
         while(_loc10_ <= _loc8_)
         {
            _loc4_ = param2 > 0?int(param2 - 1):int(param2);
            while(_loc4_ <= _loc9_)
            {
               _loc5_ = _loc10_ + _loc4_ * width_;
               _loc6_ = squares_[_loc5_];
               if(_loc6_ != null && (_loc6_.props_.hasEdge || _loc6_.tileType_ != param3))
               {
                  _loc6_.faces_.length = 0;
               }
               _loc4_++;
            }
            _loc10_++;
         }
      }
      
      override public function addObj(param1:BasicObject, param2:Number, param3:Number) : void
      {
         param1.x_ = param2;
         param1.y_ = param3;
         if(param1 is ParticleEffect)
         {
            (param1 as ParticleEffect).easyRender = !Parameters.data_.particleEffect;
         }
         if(this._updatingObjects)
         {
            this._addObjectQueue.push(param1);
         }
         else
         {
            this.internalAddObj(param1);
         }
      }
      
      public function internalAddObj(param1:BasicObject) : void
      {
         if(!param1.addTo(this,param1.x_,param1.y_))
         {
            return;
         }
         var _loc2_:Dictionary = param1 is GameObject?goDict_:oDict_;
         if(_loc2_[param1.objectId_] != null)
         {
            return;
         }
         _loc2_[param1.objectId_] = param1;
      }
      
      override public function removeObj(param1:int) : void
      {
         if(this._updatingObjects)
         {
            this._removeObjectQueue.push(param1);
         }
         else
         {
            this.internalRemoveObj(param1);
         }
      }
      
      public function internalRemoveObj(param1:int) : void
      {
         var _loc2_:Dictionary = goDict_;
         var _loc3_:BasicObject = _loc2_[param1];
         if(_loc3_ == null)
         {
            _loc2_ = oDict_;
            _loc3_ = _loc2_[param1];
            if(_loc3_ == null)
            {
               return;
            }
         }
         _loc3_.removeFromMap();
         delete _loc2_[param1];
         _loc3_ = this.visibleHitObjs[param1];
         if(_loc3_ != null)
         {
            delete this.visibleHitObjs[param1];
         }
      }
      
      public function getSquare(param1:Number, param2:Number) : com.company.assembleegameclient.map.Square
      {
         if(param1 < 0 || param1 >= width_ || param2 < 0 || param2 >= height_)
         {
            return null;
         }
         var _loc3_:int = int(param1) + int(param2) * width_;
         var _loc4_:com.company.assembleegameclient.map.Square = squares_[_loc3_];
         if(_loc4_ == null)
         {
            _loc4_ = new com.company.assembleegameclient.map.Square(this,int(param1),int(param2));
            squares_[_loc3_] = _loc4_;
            _0bx.push(_loc4_);
         }
         return _loc4_;
      }
      
      public function lookupSquare(param1:int, param2:int) : com.company.assembleegameclient.map.Square
      {
         if(param1 < 0 || param1 >= width_ || param2 < 0 || param2 >= height_)
         {
            return null;
         }
         return squares_[param1 + param2 * width_];
      }
      
      override public function draw(param1:View, param2:int) : void
      {
         var _loc17_:com.company.assembleegameclient.map.Square = null;
         var _loc18_:int = 0;
         var _loc19_:GameObject = null;
         var _loc20_:BasicObject = null;
         var _loc21_:* = undefined;
         var _loc22_:int = 0;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:uint = 0;
         var _loc29_:* = undefined;
         var _loc30_:Array = null;
         var _loc31_:Number = NaN;
         var _loc3_:Rectangle = param1.rect;
         var _loc4_:* = stage.scaleMode == StageScaleMode.NO_SCALE;
         var _loc5_:Number = Parameters.data_["mscale"];
         if(_loc4_)
         {
            x = -_loc3_.x * 800 / WebMain.sWidth * _loc5_;
            y = -_loc3_.y * 600 / WebMain.sHeight * _loc5_;
         }
         else
         {
            x = -_loc3_.x;
            y = -_loc3_.y;
         }
         var _loc6_:Number = (-_loc3_.x - _loc3_.width / 2) / 50;
         var _loc7_:Number = (-_loc3_.y - _loc3_.height / 2) / 50;
         var _loc8_:Number = Math.sqrt(_loc6_ * _loc6_ + _loc7_ * _loc7_);
         var _loc9_:Number = param1.angleRad_ - Math.PI / 2 - Math.atan2(_loc6_,_loc7_);
         var _loc10_:Point = new Point(param1.x_ + _loc8_ * Math.cos(_loc9_),param1.y_ + _loc8_ * Math.sin(_loc9_));
         var _loc11_:Stage3D = WebMain.stage_.stage3Ds[0];
         if(hwAccel)
         {
            _loc11_.x = 400 - Screen3D.HalfWidth * _loc5_;
            _loc11_.y = 300 - Screen3D.HalfHeight * _loc5_;
         }
         if(hwAccel != Parameters.hwAccel())
         {
            _loc21_ = WebMain.stage_.stage3Ds[0].context3D;
            if(hwAccel == true && _loc21_ != null && _loc21_.driverInfo.toLowerCase().indexOf("disposed") == -1)
            {
               _loc21_.clear();
               _loc21_.present();
            }
            else
            {
               map_.graphics.clear();
            }
            signalRenderSwitch.dispatch(hwAccel);
            hwAccel = Parameters.hwAccel();
         }
         if(background_ != null && !_loc4_)
         {
            background_.draw(param1,param2);
         }
         this.visibleObjs.length = 0;
         this.visibleHitObjs.length = 0;
         this.visibleGroundObjs.length = 0;
         this.tiles.length = 0;
         this.sqrAnimations.length = 0;
         var _loc12_:int = param1.maxDist;
         var _loc13_:int = Math.max(0,_loc10_.x - _loc12_);
         var _loc14_:int = Math.min(width_ - 1,_loc10_.x + _loc12_);
         var _loc15_:int = Math.max(0,_loc10_.y - _loc12_);
         var _loc16_:int = Math.min(height_ - 1,_loc10_.y + _loc12_);
         this.graphicsData_.length = 0;
         this.graphics3dData_.length = 0;
         this.objects3D.length = 0;
         _loc18_ = _loc13_;
         while(_loc18_ <= _loc14_)
         {
            _loc22_ = _loc15_;
            while(_loc22_ <= _loc16_)
            {
               _loc17_ = squares_[_loc18_ + _loc22_ * width_];
               if(_loc17_ != null)
               {
                  _loc23_ = _loc10_.x - _loc17_.center_.x;
                  _loc24_ = _loc10_.y - _loc17_.center_.y;
                  _loc25_ = _loc23_ * _loc23_ + _loc24_ * _loc24_;
                  if(_loc25_ <= param1.maxSqrDist)
                  {
                     _loc17_.drawTime = param2;
                     _loc17_.draw(this.graphicsData_,param1,param2);
                     this.tiles.push(_loc17_);
                     if(_loc17_.animation != null)
                     {
                        this.sqrAnimations.push(_loc17_);
                     }
                  }
               }
               _loc22_++;
            }
            _loc18_++;
         }
         for each(_loc19_ in goDict_)
         {
            _loc19_.isVisible = false;
            if(!_loc19_.dying_)
            {
               _loc17_ = _loc19_.square_;
               if(_loc17_ != null && _loc17_.drawTime == param2)
               {
                  _loc19_.isVisible = true;
                  _loc19_.initObjBoundary(param1);
                  if(_loc19_.props_.groundDraw_)
                  {
                     if(_loc19_.props_.drawOnGround_)
                     {
                        _loc19_.draw(this.graphicsData_,param1,param2);
                     }
                     else
                     {
                        this.visibleGroundObjs.push(_loc19_);
                     }
                  }
                  else
                  {
                     this.visibleObjs.push(_loc19_);
                     if(!(_loc19_ is ParticleEffect))
                     {
                        this.visibleHitObjs.push(_loc19_);
                     }
                  }
               }
            }
         }
         for each(_loc20_ in oDict_)
         {
            _loc20_.isVisible = false;
            _loc17_ = _loc20_.square_;
            if(_loc17_ != null && _loc17_.drawTime == param2)
            {
               _loc20_.isVisible = true;
               _loc20_.initObjBoundary(param1);
               this.visibleObjs.push(_loc20_);
            }
         }
         if(this.visibleGroundObjs.length > 0)
         {
            this.visibleGroundObjs.sortOn(SortParameters,SortTypes);
            for each(_loc20_ in this.visibleGroundObjs)
            {
               _loc20_.draw(this.graphicsData_,param1,param2);
            }
         }
         this.visibleObjs.sortOn(SortParameters,SortTypes);
         if(Parameters.data_.drawShadows)
         {
            for each(_loc20_ in this.visibleObjs)
            {
               if(_loc20_.hasShadow)
               {
                  _loc20_.drawShadow(this.graphicsData_,param1,param2);
               }
            }
         }
         for each(_loc20_ in this.visibleObjs)
         {
            _loc20_.draw(this.graphicsData_,param1,param2);
            if(Parameters.hwAccel())
            {
               _loc20_.draw3d(this.objects3D);
            }
         }
         if(this.sqrAnimations.length > 0)
         {
            for each(_loc17_ in this.sqrAnimations)
            {
               _loc17_.animate(this.graphicsData_,param1,param2);
            }
         }
         if(player_ != null && player_.breath_ >= 0 && player_.breath_ < Parameters.LowBreath)
         {
            _loc26_ = (Parameters.LowBreath - player_.breath_) / Parameters.LowBreath;
            _loc27_ = Math.abs(Math.sin(param2 / 300)) * 0.75;
            RedDangerOverlay.alphaMultiplier = _loc26_ * _loc27_;
            breathOverlay_.transform.colorTransform = RedDangerOverlay;
            breathOverlay_.visible = true;
            breathOverlay_.x = _loc3_.left;
            breathOverlay_.y = _loc3_.top;
         }
         else
         {
            breathOverlay_.visible = false;
         }
         if(player_ != null && !Parameters.HideHud && !_loc4_)
         {
            sideBarGradient.visible = true;
            sideBarGradient.x = _loc3_.right - 10;
            sideBarGradient.y = _loc3_.top;
         }
         else
         {
            sideBarGradient.visible = false;
         }
         if(Parameters.hwAccel() && R3D.Ready)
         {
            _loc28_ = this.getEffectFilterType();
            GameContext.getInjector().getInstance(_1Z_O_).dispatch(this.graphicsData_,this.objects3D,width_,height_,param1,_loc28_);
            _loc18_ = 0;
            while(_loc18_ < this.graphicsData_.length)
            {
               _loc29_ = this.graphicsData_[_loc18_];
               if(_loc29_ is GraphicsBitmapFill && HWAccelerate.hasBitmapFill(GraphicsBitmapFill(_loc29_)) || _loc29_ is GraphicsSolidFill && HWAccelerate.hasSolidFill(GraphicsSolidFill(_loc29_)))
               {
                  this.graphics3dData_.push(_loc29_);
                  this.graphics3dData_.push(this.graphicsData_[_loc18_ + 1]);
                  this.graphics3dData_.push(this.graphicsData_[_loc18_ + 2]);
               }
               _loc18_++;
            }
            if(this.graphics3dData_.length > 0)
            {
               map_.graphics.clear();
               map_.graphics.drawGraphicsData(this.graphics3dData_);
               if(this._empty3dData)
               {
                  this._empty3dData = false;
               }
            }
            else if(!this._empty3dData)
            {
               map_.graphics.clear();
               this._empty3dData = true;
            }
            if(param2 % 149 == 0)
            {
               HWAccelerate._0A_Q_();
            }
         }
         else
         {
            map_.graphics.clear();
            map_.graphics.drawGraphicsData(this.graphicsData_);
         }
         map_.filters.length = 0;
         if(player_ != null && (player_.condition_[ConditionEffect.FirstOrder] & ConditionEffect.FilteredEffect) != 0)
         {
            _loc30_ = [];
            if(player_.isDrunk())
            {
               _loc31_ = 20 + 10 * Math.sin(param2 / 1000);
               _loc30_.push(new BlurFilter(_loc31_,_loc31_));
            }
            if(player_.isBlind())
            {
               _loc30_.push(BlindFilter);
            }
            map_.filters = _loc30_;
         }
         else if(map_.filters.length > 0)
         {
            map_.filters = [];
         }
         mapOverlay_.draw(param1,param2);
         partyOverlay_.draw(param1,param2);
         if(player_ && player_.isDarkness())
         {
            this.darknessOverlay_.visible = true;
            this.darknessOverlay_.x = _loc3_.left;
            this.darknessOverlay_.y = _loc3_.top - (!!Parameters.data_.centerOnPlayer?5 / 24 * _loc3_.height:0);
         }
         else
         {
            this.darknessOverlay_.visible = false;
         }
      }
      
      private function getEffectFilterType() : uint
      {
         var _loc1_:uint = 0;
         if(player_ != null && (player_.condition_[ConditionEffect.FirstOrder] & ConditionEffect.FilteredEffect) != 0)
         {
            if(player_.isPaused())
            {
               _loc1_ = R3D.STAGE3D_FILTER_PAUSE;
            }
            else if(player_.isBlind())
            {
               _loc1_ = R3D.STAGE3D_FILTER_BLIND;
            }
            else if(player_.isDrunk())
            {
               _loc1_ = R3D.STAGE3D_FILTER_DRUNK;
            }
         }
         return _loc1_;
      }
   }
}
