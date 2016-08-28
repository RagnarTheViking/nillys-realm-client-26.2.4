package _ju
{
   import flash.display.Sprite;
   import _1S_0._1mh;
   import _f7.Signal;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import _1gF_.SimpleText;
   import flash.display.Bitmap;
   import flash.filters.ColorMatrixFilter;
   import flash.utils.Timer;
   import flash.geom.Point;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.assembleegameclient.parameters.Parameters;
   import _1xa.SText;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.events.Event;
   import com.company.util.GraphicHelper;
   import com.company.util.MoreColorUtil;
   import com.company.util.TextureLibrary;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import flash.filters.DropShadowFilter;
   import flash.display.DisplayObject;
   
   public class _0j1 extends Sprite
   {
      
      private static const _0P_k:uint = 250;
      
      private static const _R_i:int = 3;
      
      public static var _0M_b:int = 84;
      
      private static var _0S_G_:int = 24;
      
      private static var _0L_T_:int = 4;
      
      private static var _0bb:int = 13;
      
      private static var _0lZ_:int = -6;
       
      
      public var position:int;
      
      public var objectType:int;
      
      public var _E_4:_1mh;
      
      public var _0N_u:Signal;
      
      public var _1N_O_:Signal;
      
      private var _023:GraphicsSolidFill;
      
      private var _0gg:GraphicsSolidFill;
      
      private var _128:GraphicsSolidFill;
      
      private var _L_p:GraphicsPath;
      
      private var _us:GraphicsPath;
      
      private var _hV_:Vector.<IGraphicsData>;
      
      private var _1rd:Vector.<IGraphicsData>;
      
      private var _C_U_:Vector.<IGraphicsData>;
      
      private var text:SimpleText;
      
      private var _00j:Bitmap;
      
      private var _S_F_:Sprite;
      
      private var _1A_G_:Bitmap;
      
      private var bg:Sprite;
      
      private var _0sK_:ColorMatrixFilter;
      
      private var _P_2:Timer;
      
      private var _170:Point;
      
      private var _f:Boolean;
      
      private var _07R_:Boolean;
      
      public function _0j1(param1:Array, param2:int)
      {
         var _loc3_:BitmapData = null;
         this._023 = new GraphicsSolidFill(5526612,1);
         this._0gg = new GraphicsSolidFill(4078909,1);
         this._128 = new GraphicsSolidFill(2368034,1);
         this._L_p = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this._us = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this._hV_ = new <IGraphicsData>[this._023,this._L_p,GraphicHelper.END_FILL];
         this._1rd = new <IGraphicsData>[this._0gg,this._L_p,GraphicHelper.END_FILL];
         this._C_U_ = new <IGraphicsData>[this._128,this._us,GraphicHelper.END_FILL];
         super();
         mouseChildren = false;
         this.position = param2;
         this._0sK_ = new ColorMatrixFilter(MoreColorUtil._iz);
         _loc3_ = TextureLibrary.getBitmap("lofiObj3",225);
         _loc3_ = TextureRedrawer.redraw(_loc3_,30,false,0);
         this.text = new SimpleText().setSize(13).setColor(16777215).setTextWidth(_0M_b).setTextHeight(_0S_G_);
         this.text.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         this.text.y = 4;
         this._00j = new Bitmap(_loc3_);
         this._00j.x = 52;
         this._00j.y = -6;
         this._00j.visible = false;
         this.bg = new Sprite();
         GraphicHelper.clearGraphicsPath(this._L_p);
         GraphicHelper.drawUi(0,0,_0M_b,_0S_G_,4,param1,this._L_p);
         GraphicHelper.drawUi(2,2,_0M_b - _0L_T_,_0S_G_ - _0L_T_,4,param1,this._us);
         this.bg.graphics.drawGraphicsData(this._1rd);
         this.bg.graphics.drawGraphicsData(this._C_U_);
         addChild(this.bg);
         addChild(this._00j);
         addChild(this.text);
         this._S_F_ = new Sprite();
         this._P_2 = new Timer(_0P_k,1);
         this._P_2.addEventListener(TimerEvent.TIMER_COMPLETE,this._0v4);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._E_4 = new _1mh(this,MouseEvent.CLICK,MouseEvent);
         this._0N_u = new Signal();
         this._1N_O_ = new Signal(DisplayObject);
      }
      
      public function _do(param1:int, param2:int, param3:Boolean, param4:int = -1) : void
      {
         var _loc5_:int = 0;
         var _loc6_:BitmapData = null;
         var _loc7_:Bitmap = null;
         if(param4 != -1)
         {
            this.objectType = param4;
            if(this._1A_G_ != null)
            {
               removeChild(this._1A_G_);
            }
            _loc6_ = ObjectLibrary.getRedrawnTextureFromType(param4,55,false);
            this._1A_G_ = new Bitmap(_loc6_);
            this._1A_G_.y = -11;
            addChild(this._1A_G_);
            _loc6_ = ObjectLibrary.getRedrawnTextureFromType(param4,80,true);
            _loc7_ = new Bitmap(_loc6_);
            _loc7_.x = _loc7_.x - 30;
            _loc7_.y = _loc7_.y - 30;
            this._S_F_.addChild(_loc7_);
         }
         var _loc8_:* = param1 > 0;
         if(_loc8_)
         {
            this._0J_p(String(param1));
            _loc5_ = _0bb;
            this.bg.graphics.clear();
            this.bg.graphics.drawGraphicsData(this._hV_);
            this.text.x = _0M_b / 2 + 5;
         }
         else
         {
            this._0J_p(String(param2));
            _loc5_ = _0lZ_;
            this.bg.graphics.clear();
            this.bg.graphics.drawGraphicsData(this._1rd);
            this.bg.graphics.drawGraphicsData(this._C_U_);
            this.text.x = this._00j.x - this.text.width + 6;
         }
         if(this._1A_G_)
         {
            this._1A_G_.x = _loc5_;
         }
         if(!_loc8_)
         {
            if(Parameters.data_.contextualPotionBuy)
            {
               this.text.setColor(16777215);
               this._00j.filters = [];
               this._00j.visible = true;
            }
            else
            {
               this.text.setColor(11184810);
               this._00j.filters = [this._0sK_];
               this._00j.visible = true;
            }
         }
         else
         {
            this.text.setColor(16777215);
            this._00j.filters = [];
            this._00j.visible = false;
         }
      }
      
      public function _0J_p(param1:String) : void
      {
         this.text.setStringBuilder(new SText(param1));
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._G_h(false);
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         if(this._07R_)
         {
            return;
         }
         if(param1.shiftKey)
         {
            this._G_h(false);
            this._0N_u.dispatch();
         }
         else if(!this._f)
         {
            this._G_h(true);
         }
         else
         {
            this._G_h(false);
            this._0N_u.dispatch();
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         if(!this._00j.visible)
         {
            this._1wQ_(param1);
         }
      }
      
      private function _G_h(param1:Boolean) : void
      {
         this._f = param1;
         if(this._f)
         {
            this._P_2.reset();
            this._P_2.start();
         }
         else
         {
            this._P_2.stop();
         }
      }
      
      private function _1wQ_(param1:MouseEvent) : void
      {
         this._170 = new Point(param1.stageX,param1.stageY);
         addEventListener(MouseEvent.MOUSE_MOVE,this._1F_8);
         addEventListener(MouseEvent.MOUSE_OUT,this._j7);
         addEventListener(MouseEvent.MOUSE_UP,this._j7);
      }
      
      private function _j7(param1:MouseEvent) : void
      {
         removeEventListener(MouseEvent.MOUSE_MOVE,this._1F_8);
         removeEventListener(MouseEvent.MOUSE_OUT,this._j7);
         removeEventListener(MouseEvent.MOUSE_UP,this._j7);
      }
      
      private function _1F_8(param1:MouseEvent) : void
      {
         var _loc2_:Number = param1.stageX - this._170.x;
         var _loc3_:Number = param1.stageY - this._170.y;
         var _loc4_:Number = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
         if(_loc4_ > _R_i)
         {
            this._j7(null);
            this._G_h(false);
            this._gm();
         }
      }
      
      private function _0v4(param1:TimerEvent) : void
      {
         this._G_h(false);
      }
      
      private function _gm() : void
      {
         this._07R_ = true;
         this._S_F_.startDrag(true);
         stage.addChild(this._S_F_);
         this._S_F_.addEventListener(MouseEvent.MOUSE_UP,this._00d);
      }
      
      private function _00d(param1:MouseEvent) : void
      {
         this._07R_ = false;
         this._S_F_.stopDrag();
         this._S_F_.x = this._170.x;
         this._S_F_.y = this._170.y;
         stage.removeChild(this._S_F_);
         this._S_F_.removeEventListener(MouseEvent.MOUSE_UP,this._00d);
         this._1N_O_.dispatch(this._S_F_.dropTarget);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this._G_h(false);
         this._j7(null);
         if(this._07R_)
         {
            this._S_F_.stopDrag();
         }
      }
   }
}
