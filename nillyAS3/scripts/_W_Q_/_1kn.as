package _W_Q_
{
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import flash.display.Shape;
   import com.company.assembleegameclient.ui.ScrollBar;
   import flash.utils.getTimer;
   import flash.events.Event;
   import flash.display.DisplayObject;
   import _C_._1O_I_;
   import com.company.assembleegameclient.util.Star;
   import flash.display.BitmapData;
   import com.company.util.BitmapUtil;
   import flash.display.Bitmap;
   
   public class _1kn extends Sprite
   {
       
      
      private var rect_:Rectangle;
      
      private var mask_:Shape;
      
      private var _kJ_:Sprite;
      
      private var _6e:Vector.<_W_Q_._0G_K_>;
      
      private var _0I_d:ScrollBar;
      
      private var startTime_:int;
      
      public function _1kn(param1:Rectangle, param2:XML)
      {
         var _loc3_:XML = null;
         this.mask_ = new Shape();
         this._kJ_ = new Sprite();
         this._6e = new Vector.<_W_Q_._0G_K_>();
         super();
         this.rect_ = param1;
         graphics.lineStyle(1,4802889,2);
         graphics.drawRect(this.rect_.x + 1,this.rect_.y + 1,this.rect_.width - 2,this.rect_.height - 2);
         graphics.lineStyle();
         this._0I_d = new ScrollBar(16,this.rect_.height);
         this._0I_d.addEventListener(Event.CHANGE,this._074);
         this.mask_.graphics.beginFill(16777215,1);
         this.mask_.graphics.drawRect(this.rect_.x,this.rect_.y,this.rect_.width,this.rect_.height);
         this.mask_.graphics.endFill();
         addChild(this.mask_);
         mask = this.mask_;
         addChild(this._kJ_);
         this._1wt(_1O_I_._jd,null,0,param2.Shots,false,5746018);
         if(int(param2.Shots) != 0)
         {
            this._1wt(_1O_I_._1P_H_,null,0,100 * Number(param2.ShotsThatDamage) / Number(param2.Shots),true,5746018,"","%");
         }
         this._1wt(_1O_I_._0pZ_,null,0,param2.TilesUncovered,false,5746018);
         this._1wt(_1O_I_._0__f,null,0,param2.MonsterKills,false,5746018);
         this._1wt(_1O_I_._000,null,0,param2.GodKills,false,5746018);
         this._1wt(_1O_I_._16k,null,0,param2.OryxKills,false,5746018);
         this._1wt(_1O_I_._3,null,0,param2.QuestsCompleted,false,5746018);
         this._1wt(_1O_I_._0W_x,null,0,int(param2.PirateCavesCompleted) + int(param2.UndeadLairsCompleted) + int(param2.AbyssOfDemonsCompleted) + int(param2.SnakePitsCompleted) + int(param2.SpiderDensCompleted) + int(param2.SpriteWorldsCompleted) + int(param2.TombsCompleted),false,5746018);
         this._1wt(_1O_I_._R_Q_,null,0,param2.LevelUpAssists,false,5746018);
         var _loc4_:BitmapData = Star._0a__();
         _loc4_ = BitmapUtil._0P_V_(_loc4_,6,6,_loc4_.width - 12,_loc4_.height - 12);
         this._1wt(_1O_I_._1O_H_,null,0,param2.BaseFame,true,16762880,"","",new Bitmap(_loc4_));
         for each(_loc3_ in param2.Bonus)
         {
            this._1wt(_loc3_.@id,_loc3_.@desc,_loc3_.@level,int(_loc3_),true,16762880,"+","",new Bitmap(_loc4_));
         }
      }
      
      public function _0V_o() : void
      {
         var _loc1_:_W_Q_._0G_K_ = null;
         this._1Z_Y_();
         this.startTime_ = -int.MAX_VALUE;
         for each(_loc1_ in this._6e)
         {
            _loc1_._0D_8();
         }
      }
      
      public function _1Z_Y_() : void
      {
         this.startTime_ = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function _074(param1:Event) : void
      {
         var _loc2_:Number = this._0I_d._zH_();
         this._kJ_.y = _loc2_ * (this.rect_.height - this._kJ_.height - 15) + 5;
      }
      
      private function _1wt(param1:String, param2:String, param3:int, param4:int, param5:Boolean, param6:uint, param7:String = "", param8:String = "", param9:DisplayObject = null) : void
      {
         if(param4 == 0 && !param5)
         {
            return;
         }
         this._6e.push(new _W_Q_._0G_K_(20,11776947,param6,param1,param2,param3,param4,param7,param8,param9));
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:_W_Q_._0G_K_ = null;
         var _loc6_:int = 0;
         var _loc4_:Number = this.startTime_ + 2000 * (this._6e.length - 1) / 2;
         _loc2_ = getTimer();
         var _loc5_:int = Math.min(this._6e.length,2 * (getTimer() - this.startTime_) / 2000 + 1);
         while(_loc6_ < _loc5_)
         {
            _loc3_ = this._6e[_loc6_];
            _loc3_.y = 28 * _loc6_;
            this._kJ_.addChild(_loc3_);
            _loc6_++;
         }
         this._kJ_.y = this.rect_.height - this._kJ_.height - 10;
         if(_loc2_ > _loc4_ + 1000)
         {
            this._S_V_();
            dispatchEvent(new Event(Event.COMPLETE));
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function _S_V_() : void
      {
         graphics.clear();
         graphics.lineStyle(1,4802889,2);
         graphics.drawRect(this.rect_.x + 1,this.rect_.y + 1,this.rect_.width - 26,this.rect_.height - 2);
         graphics.lineStyle();
         this._0I_d.x = this.rect_.width - 16;
         this._0I_d._0jj(this.mask_.height,this._kJ_.height);
         this._0I_d._1mX_(1);
         addChild(this._0I_d);
      }
   }
}
