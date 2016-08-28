package _4Z_
{
   import _f7.Signal;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import com.company.util.MoreColorUtil;
   import flash.events.Event;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _C_._1O_I_;
   import _1pm._0P_M_;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.util._P_K_;
   import _1__H_._1O_8;
   import _1__H_._0vs;
   import _0wX_._L_I_;
   
   public class _6z extends _08i
   {
       
      
      public const _032:Signal = new Signal(int);
      
      public const _1V_Y_:Signal = new Signal();
      
      public var _J_q:Boolean = false;
      
      private var _1K_H_:Function;
      
      protected var _0sK_:ColorMatrixFilter;
      
      public var _Z_0:Boolean = true;
      
      public function _6z()
      {
         this._0sK_ = new ColorMatrixFilter(MoreColorUtil._iz);
         super();
         itemSprite.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.updateTitle();
      }
      
      public function _0bC_(param1:Boolean) : void
      {
         var _loc2_:ColorTransform = null;
         if(this._J_q != param1)
         {
            this._J_q = param1;
            itemSprite.filters = !!param1?[this._0sK_]:[];
            _loc2_ = !!param1?MoreColorUtil._J_J_:new ColorTransform();
            itemSprite.transform.colorTransform = _loc2_;
         }
      }
      
      override protected function onRemovedFromStage(param1:Event) : void
      {
         super.onRemovedFromStage(param1);
         this._Y_g();
      }
      
      public function setItem(param1:int, param2:int, param3:int, param4:Function) : void
      {
         if(this.itemId != param1)
         {
            this._Y_g();
            this.itemId = param1;
            this.slotId = param2;
            this.objectId = param3;
            itemSlotSprite.bitmapData = ObjectLibrary.getRedrawnTextureFromType(param1,80,true);
            _0du();
            this.updateTitle();
            this._1K_H_ = param4;
         }
      }
      
      public function _0al(param1:int) : void
      {
         this._032.dispatch(param1);
      }
      
      public function updateTitle() : void
      {
         var _loc1_:XML = null;
         var _loc2_:String = null;
         if(itemId && itemId != -1)
         {
            setTitle(_1O_I_._1Y_M_,{});
            _loc1_ = ObjectLibrary._0W_b(ObjectLibrary._M_(itemId));
            _loc2_ = !!_loc1_.hasOwnProperty("feedPower")?_loc1_.feedPower:"0";
            setDescription(_1O_I_._1N_q,{"data":_loc2_});
         }
         else
         {
            setTitle(_1O_I_._089,{});
            setDescription(_1O_I_._1N_q,{"data":""});
         }
      }
      
      public function _2u(param1:Function) : void
      {
         this._1K_H_ = param1;
      }
      
      public function _1E_u() : void
      {
         this._Y_g();
         itemId = _0P_M_._F_p;
         itemSlotSprite.bitmapData = null;
         slotId = -1;
         objectId = -1;
         this.updateTitle();
      }
      
      private function _Y_g() : void
      {
         this._1K_H_ && this._1K_H_();
         this._1K_H_ = null;
      }
      
      private function _1bY_(param1:int, param2:int) : void
      {
         itemSlotSprite.x = -itemSlotSprite.width / 2;
         itemSlotSprite.y = -itemSlotSprite.height / 2;
         itemSprite.x = param1;
         itemSprite.y = param2;
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         if(!this._J_q)
         {
            this._1bY_(param1.stageX,param1.stageY);
            itemSprite.startDrag(true);
            itemSprite.addEventListener(MouseEvent.MOUSE_UP,this._00d);
            if(itemSprite.parent != null && itemSprite.parent != stage)
            {
               removeChild(itemSprite);
               stage.addChild(itemSprite);
            }
         }
      }
      
      private function _00d(param1:MouseEvent) : void
      {
         itemSprite.stopDrag();
         itemSprite.removeEventListener(MouseEvent.MOUSE_UP,this._00d);
         stage.removeChild(itemSprite);
         addChild(itemSprite);
         _0du();
         var _loc2_:* = _P_K_._0Z_w(itemSprite.dropTarget,_1O_8,_0vs,_L_I_);
         if(!(_loc2_ is _1O_8) && !(_loc2_ is _0vs) && !(_loc2_ is _L_I_ && (_loc2_ as _L_I_)._1td == true))
         {
            this._Z_0 = true;
            itemId = _0P_M_._F_p;
            itemSlotSprite.bitmapData = null;
            this._Y_g();
            this._1V_Y_.dispatch();
            this.updateTitle();
         }
      }
   }
}
