package {
	import com.ui.Stage1;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import resources.bg.MainBG;

	[SWF (width="620", height="620", backgroundColor="0xffffff")]
	public class HisardutFinalGame extends Sprite
	{
		private var stage1:Stage1;
		
		public function HisardutFinalGame()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			addChild(new MainBG());
			stage1 = new Stage1();
			addChild(stage1);
			stage1.addEventListener(Event.CHANGE,onNextStage);		
		}
		
		private function onNextStage(event:Event):void
		{
			
		}
		
	}
}
