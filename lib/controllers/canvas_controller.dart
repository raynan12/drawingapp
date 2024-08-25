import 'package:get/get.dart';

class CanvasController extends GetxController {
  var canvases = <String>[].obs;
  var selectedCanvasIndex = (-1).obs;

  // Função para adicionar um novo canvas à lista
  void addCanvas(String canvasName) {
    canvases.add(canvasName);
  }

  // Função para selecionar um canvas específico para edição
  void selectCanvas(int index) {
    selectedCanvasIndex.value = index;
  }

  // Função para atualizar o nome do canvas selecionado
  void updateCanvasName(String newName) {
    if (selectedCanvasIndex.value != -1) {
      canvases[selectedCanvasIndex.value] = newName;
    }
  }

  // Função para obter o nome do canvas selecionado
  String get selectedCanvasName {
    if (selectedCanvasIndex.value != -1) {
      return canvases[selectedCanvasIndex.value];
    }
    return '';
  }

  // Função para atualizar o nome de um canvas por índice
  void updateCanvasNameByIndex(int index, String newName) {
    if (index >= 0 && index < canvases.length) {
      canvases[index] = newName;
    }
  }
}
